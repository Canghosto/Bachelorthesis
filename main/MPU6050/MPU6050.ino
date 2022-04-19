#include "Wire.h"
#include "Adafruit_MPU6050.h"
#include "Adafruit_Sensor.h"
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
const char* udpAddress = "eduroam";
uint16_t udpPort = 8080;
IPAddress ipAddress(192,168,178,25);


char buffer[125];



//Mulitplexer Address
#define TCAADDR 0x70

/*
 * Created array of 8 for every possible MUX port
 * for the possibilitie that the IMUs need to be changed or
 * the connection on ports are disturbed
*/
Adafruit_MPU6050 mpuFinger[8] = {};
MPU9250 coreMPU;
MPU9250Setting setting9250;

/*
 * Set 0 if no IMU was detected on MUX port
 * Set 1 if MPU 6050 was found for 2-DoF
 * Set 2 if MPU 6050 (Thumb) was found for 3-DoF
 * Set 3 if MPU 9250 (Palm) was found for 3-DoF and Magnetometer
*/
uint8_t foundIMU[8] = {0};
int seq = 0;

//TCA Selector
void tcaselect(uint8_t i) {
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << i);
  Wire.endTransmission();
}

void initMPU(uint8_t imuID){
  digitalWrite(5, HIGH);
  tcaselect(imuID);
  Serial.print("Initialize MPU6050: "); Serial.println(imuID);
  if (mpuFinger[imuID].begin()) {
    Serial.println("MPU6050 Found!");
    foundIMU[imuID] = 1;

    //Set config for MPU-6050
    mpuFinger[imuID].setAccelerometerRange(MPU6050_RANGE_2_G);
    mpuFinger[imuID].setGyroRange(MPU6050_RANGE_2000_DEG);
    mpuFinger[imuID].setFilterBandwidth(MPU6050_BAND_260_HZ);
  }
  else{
    Serial.print(F("Failed to find MPU6050 chip, mpu["));
    Serial.print(imuID);
    Serial.println(']');
    Serial.println("Check for MPU9250");
    if(coreMPU.setup(0x68, setting9250)){
      //Calibrating MPU-9250
      //Setting to 3(3-DoF with Mag).
      foundIMU[imuID] = 3;
      Serial.println("Found MPU9250");

      /*
      //Calibrating the MPU-9250
      Serial.println("Accel Gyro calibration will start in 5sec.");
      Serial.println("Please leave the device still on the flat plane.");
      coreMPU.verbose(true);
      delay(5000);
      coreMPU.calibrateAccelGyro();
      Serial.println("Mag calibration will start in 5sec.");
      Serial.println("Please Wave device in a figure eight until done.");
      delay(5000);
      coreMPU.calibrateMag();
      coreMPU.verbose(false);
      */

    }
    else{
      Serial.println(F("Failed to find MPU9250 chip"));
      Serial.println(F("Halting..."));
      while (1) {
      delay(10);
      }
    }
  }

  digitalWrite(5, LOW);
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
          initMPU(t);
          Serial.println(addr);
          }
        }
      }
    }
}



// Standard Arduino setup()
void setup(){
    Wire.begin();
    //Set the frequency to 400kHz
    Wire.setClock(400000UL);
    Serial.begin(115200);

    //Check if we read something in the Serial
    udp.setupWiFi(ssid, pwd, ipAddress, udpPort, username);          //Can be set if wireless communication is needed
      //udp.setupAsAP(ssid, pwd);
    while (!Serial);
    delay(1000);

    pinMode(5, OUTPUT);


    digitalWrite(5, LOW);

    //Set Wifi connection, if Glove is wireless

    Serial.println("\nTCAScanner ready!");

    setting9250.accel_fs_sel = ACCEL_FS_SEL::A2G;
    setting9250.gyro_fs_sel = GYRO_FS_SEL::G2000DPS;
    setting9250.mag_output_bits = MAG_OUTPUT_BITS::M16BITS;
    setting9250.fifo_sample_rate = FIFO_SAMPLE_RATE::SMPL_1000HZ;
    setting9250.gyro_fchoice = 0x03;
    setting9250.accel_fchoice = 0x01;

    identifyIMU();

    Serial.println("\ndone");
}

sensors_event_t a, g, temp;

bool readMPUFinger(uint8_t port, char* buf, int seq){
  tcaselect(port);
  memset(&buffer[0], 0, sizeof(buffer));
  mpuFinger[port].getEvent(&a, &g, &temp);
  sprintf(buf, " %d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f"
             , seq, port
             , a.acceleration.x, a.acceleration.y, a.acceleration.z
             , g.gyro.x, g.gyro.y, g.gyro.z);
  return true;
}

bool readMPUThumb(uint8_t port, char* buf, int seq){
  tcaselect(port);
  memset(&buffer[0], 0, sizeof(buffer));
  mpuFinger[port].getEvent(&a, &g, &temp);
  sprintf(buf, " %d %d accel %0.3f %0.3f %0.3f gyro %0.3f %0.3f %0.3f"
             , seq, port
             , a.acceleration.x, a.acceleration.y, a.acceleration.z
             , g.gyro.x, g.gyro.y, g.gyro.z);
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
        if(foundIMU[i] == 1 && readMPUFinger(i, buffer, seq)){
            udp.sendImuData(fingers ,buffer, i);
            seq = (seq + 1) % 255;
        }else if(foundIMU[i] == 2 && readMPUThumb(i, buffer, seq)){
            udp.sendImuData(thumb, buffer, i);
            seq = (seq + 1) % 255;
        }else if(foundIMU[i] == 3 && readMPUCore(i, buffer, seq)){
            udp.sendImuData(palm, buffer, i);
            seq = (seq + 1) % 255;
        }
    }

}
