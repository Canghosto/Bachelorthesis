#include "DFRobot_BMI160.h"
#include "Wire.h"
#include "MPU9250.h"
#include "udpConnection.h"

UDPCONNECTION udp;
UDPCONNECTION::PACKET_ID fingers = UDPCONNECTION::PACKET_ID::fingers;
UDPCONNECTION::PACKET_ID thumb = UDPCONNECTION::PACKET_ID::thumb;
UDPCONNECTION::PACKET_ID palm = UDPCONNECTION::PACKET_ID::palm;

//Wifi Network
const char* ssid = "ssid";
const char* username = "@studium.com";
const char* pwd = "pwd";
//UDP Address to send Data to.
uint16_t udpPort = 8080;
IPAddress ipAddress(192,168,178,25);


#define TCAADDR 0x70
#define BMIADDR 0x69


DFRobot_BMI160 bmi160[8] = {};
MPU9250 coreMPU;
MPU9250Setting setting9250;

char buffer[125];


uint8_t foundIMU[8] = {0};
int seq = 0;
float radToDeg = 3.14/180.0;




void tcaselect(uint8_t i) {
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << i);
  Wire.endTransmission();
}

void initIMU(uint8_t imuID){
  
    tcaselect(imuID);
    //Serial.print("Initialize BMI-160: "); Serial.println(imuID);
  
    if (bmi160[imuID].softReset() != BMI160_OK){
      Serial.println("Reset False");
      while(1);
    }
  
    //set and init the bmi160 i2c address
    if (bmi160[imuID].I2cInit(BMIADDR) == BMI160_OK){
      Serial.println("Found BMI-160");
      foundIMU[imuID] = 1;
        if (bmi160[imuID].setStepPowerMode(bmi160[imuID].stepNormalPowerMode) != BMI160_OK){
          Serial.println("set setStepPowerMode fail");
          while(1);
        }
        
    }
    else{
      Serial.print(F("Failed to find BMI-160 chip, bmi["));
      Serial.print(imuID);
      Serial.println(']');
      Serial.println("Check for MPU9250");
      if(coreMPU.setup(0x68, setting9250)){
         Serial.println("Found MPU-9250");
         foundIMU[imuID] = 3;
       }
       else{
          Serial.println(F("Failed to find MPU9250 chip"));
          Serial.println(F("Halting..."));
          while (1) {
            delay(10);
          } 
       }
    }
}

void identifyIMU(){
  for (uint8_t t=0; t<8; t++) {
      tcaselect(t);
      
      Serial.print("TCA Port #"); Serial.println(t);
      //delay(1000);

      for (uint8_t addr = 0; addr<=127; addr++) {
        if (addr == TCAADDR) continue;

        Wire.beginTransmission(addr);
        if (!Wire.endTransmission()) {
          Serial.print("Found I2C 0x");  Serial.println(addr,HEX);
          if(addr != 0xC){
            initIMU(t);
          }
        }
      }
    }
}

void setup(){
  Wire.begin();
  //Set the frequency to 400kHz
  Wire.setClock(400000UL);
  Serial.begin(115200);
  delay(100);
  
  //Set Wifi connection, if Glove is wireless
  if(!Serial){
      udp.setupWiFi(ssid, pwd, ipAddress, udpPort, username);
      //udp.setupAsAP(ssid, pwd);
  }
    
  Serial.println("\nTCAScanner ready!");

  
  setting9250.accel_fs_sel = ACCEL_FS_SEL::A2G;
  setting9250.gyro_fs_sel = GYRO_FS_SEL::G2000DPS;
  setting9250.mag_output_bits = MAG_OUTPUT_BITS::M16BITS;
  setting9250.fifo_sample_rate = FIFO_SAMPLE_RATE::SMPL_1000HZ;
  setting9250.gyro_fchoice = 0x03;
  setting9250.accel_fchoice = 0x01;
  
  
  //init the IMU sensors  
  identifyIMU();
    
  Serial.println("\ndone");
}

bool readBMI(uint8_t port, char* buf, int seq){
  tcaselect(port);
  memset(&buffer[0], 0, sizeof(buffer));
  uint8_t rslt;
    
  int16_t accelGyro[6]={0}; 
  //get both accel and gyro data from bmi160
  //parameter accelGyro is the pointer to store the data
  rslt = bmi160[port].getAccelGyroData(accelGyro);
  if(rslt == 0){
    sprintf(buf, " %d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f"
               , seq, port
               , accelGyro[3]/16384.0, accelGyro[4]/16384.0, accelGyro[5]/16384.0
               , accelGyro[0]*radToDeg, accelGyro[1]*radToDeg, accelGyro[2]*radToDeg);
  }
  return true;
}

bool readMPUCore(uint8_t port, char* buf, int seq){
  tcaselect(port);
  memset(&buffer[0], 0, sizeof(buffer));
  if (coreMPU.update()) {
    sprintf(buf, " %d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f mag %0.2f %0.2f %0.2f"
                 , seq, port
                 , coreMPU.getLinearAccX(), coreMPU.getLinearAccY(),coreMPU.getLinearAccZ()
                 , coreMPU.getGyroX(), coreMPU.getGyroY(), coreMPU.getGyroZ()
                 , coreMPU.getMagX(), coreMPU.getMagY(), coreMPU.getMagZ());
  }
  coreMPU.update();
  return true;
}



void loop(){  
  for(uint8_t i=0; i<8; i++){
    if(foundIMU[i] == 1 && readBMI(i, buffer, seq)){
      udp.sendImuData(fingers ,buffer, i);
      seq = (seq + 1) % 255; 
    }
    else if(foundIMU[i] == 2 && readBMI(i, buffer, seq)){
      udp.sendImuData(thumb ,buffer, i);
      seq = (seq + 1) % 255; 
      }
    else if(foundIMU[i] == 3 && readMPUCore(i, buffer, seq)){
      udp.sendImuData(palm ,buffer, i);
      seq = (seq + 1) % 255; 
      }
   }
   
}
