#include <DFRobot_BMI160.h>
#include "Wire.h"
//#include "MPU9250.h"
#include "FaBo9Axis_MPU9250.h"
#include "udpConnection.h"

UDPCONNECTION udp;
UDPCONNECTION::PACKET_ID fingers = UDPCONNECTION::PACKET_ID::fingers;
UDPCONNECTION::PACKET_ID thumb = UDPCONNECTION::PACKET_ID::thumb;
UDPCONNECTION::PACKET_ID palm = UDPCONNECTION::PACKET_ID::palm;


#define TCAADDR 0x70
#define COREADDR 0x68
#define BMIADDR 0x69


DFRobot_BMI160 bmi160[8] = {};
//MPU9250 coreMPU;
FaBo9Axis fabo_9axis;

char buffer[100];
char palmBuffer[150];
uint8_t seq = 0;

uint8_t foundIMU[8] = {0};
float radToDeg = 3.14/180.0;




uint8_t tcaselect(uint8_t i) {
  uint8_t result = 0; // 0 = success
  Wire.beginTransmission(TCAADDR);  // TCA9548A address is 0x70 .. 0x77
  Wire.write(1 << i);          // send byte to select bus
  return Wire.endTransmission();
}

void initBMI(uint8_t imuID){
  
    tcaselect(imuID);
    //Serial.print("Initialize BMI-160: "); Serial.println(imuID);

    if (bmi160[imuID].softReset() != BMI160_OK){
      Serial.println("Reset False");
      while(1);
    }
  
    //set and init the bmi160 i2c address
    if (bmi160[imuID].I2cInit(BMIADDR) == BMI160_OK){
      Serial.print("Found BMI-160");
      foundIMU[imuID] = 1;
    }
    else{
      Serial.print(F("Failed to find BMI-160 chip, bmi["));
      Serial.print(imuID);
      Serial.println(']');
      Serial.println("Check for MPU9250");
      if (fabo_9axis.begin()) {
          Serial.println("configured FaBo 9Axis I2C Brick");
          foundIMU[imuID] = 2;
        } else {
          Serial.println("device error");
          while(1);
        }
        /*
        if(coreMPU.setup(COREADDR)){
          Serial.println("Found MPU-9250");
          foundIMU[imuID] = 2;
        }
        else{
          Serial.println(F("Failed to find MPU9250 chip"));
          Serial.println(F("Halting..."));
          while (1) {
            delay(10);
          } 
        }
        */
    }
}

void identifyIMU(){
  for (uint8_t t=0; t<8; t++) {
      tcaselect(t);
      Serial.print("TCA Port #"); Serial.println(t);

      for (uint8_t addr = 0; addr<=127; addr++) {
        if (addr == TCAADDR) continue;

        Wire.beginTransmission(addr);
        if (!Wire.endTransmission()) {
          Serial.print("Found I2C 0x");  Serial.println(addr,HEX);
          if(addr != 0xC){
            initBMI(t);
          }
        }
      }
    }
}
void setup(){
  //Wire.begin();
  //Wire.setClock(400000UL);
  Serial.begin(115200);
  delay(100);
  
  Serial.println("\nTCAScanner ready!");
  //init the hardware bmin160  
  identifyIMU();
    
  Serial.println("\ndone");
}

int16_t accelGyro[6]={0}; 
uint8_t rslt1;
uint8_t rslt2;
bool readBMI(uint8_t port, char* buf, uint8_t sequenz){
  
  memset(&buffer[0], 0, sizeof(buffer));
  

  //get both accel and gyro data from bmi160
  //parameter accelGyro is the pointer to store the data
  rslt1 = bmi160[port].getGyroData(accelGyro);
  rslt2 = bmi160[port].getAccelData(accelGyro + 3);
  if(rslt1 | rslt2 == 0){
    sprintf(buf, "%d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f "
               , sequenz, port
               , accelGyro[3]/163.840, accelGyro[4]/163.840, accelGyro[5]/163.840
               , accelGyro[0]*radToDeg, accelGyro[1]*radToDeg, accelGyro[2]*radToDeg);
  }
  return true;
}


float ax,ay,az;
float gx,gy,gz;
float mx,my,mz;

bool readMPUCore(uint8_t port, char* buf, uint8_t sequenz){
  memset(&palmBuffer[0], 0, sizeof(palmBuffer));
  while(fabo_9axis.checkDataReady()){};
  fabo_9axis.readAccelXYZ(&ax,&ay,&az);
  fabo_9axis.readGyroXYZ(&gx,&gy,&gz);
  fabo_9axis.readMagnetXYZ(&mx,&my,&mz);
  sprintf(buf, "%d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f mag %0.2f %0.2f %0.2f "
               , sequenz, port
               , ax, ay, az
               , gx, gy, gz
               , mx, my, mz);
   return true;
}


void loop(){  

  
  for(uint8_t i=0; i<8; i++){
    if(foundIMU[i] == 1 && readBMI(i, buffer, seq)){
      tcaselect(i);
      udp.sendImuData(fingers ,buffer, i);
      seq = (seq + 1) % 264; 
    }
    else if(foundIMU[i] == 2 && readMPUCore(i, palmBuffer, seq)){
      tcaselect(i);
      udp.sendImuData(palm ,palmBuffer, i);
      seq = (seq + 1) % 264; 
      delay(100);
      }
   }
   
}
