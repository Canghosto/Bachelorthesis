#include "udpConnection.h"

#include "WiFiUdp.h"
#include "WiFi.h"
//#include "WebServer.h"
//#include "DNSServer.h"


UDPCONNECTION::UDPCONNECTION()
  : ipAddress(192,168,0,1)
  , ipPort(8080)
  , wifiConnected(false)
  , accessPointStatus(false)
  {};

void UDPCONNECTION::setupWiFi(const char* ssid,
                              const char* passphrase,
                              const IPAddress& ip,
                              const uint16_t targetPort ,
                              const char* username){
  Serial.print("Connection to: ");
  Serial.println(ssid);
  WiFi.mode(WIFI_STA);
  if(WiFi.status() != WL_CONNECTED){

      WiFi.begin(ssid, passphrase);
      Serial.print("Connecting to WiFi ..");
      if(WiFi.status() != WL_CONNECTED) Serial.println(".");
      delay(10000);
      if(WiFi.status() == WL_CONNECTED){
        wifiConnected = true;
        accessPointStatus = false;
        Serial.println("..CONNECTED!");
        ipAddress = ip;
        ipPort = targetPort;
        Serial.println(ipAddress);
        Serial.println(targetPort);
        wifiUdp.begin(ipPort);
      }
      else{
        Serial.println("Couldn't get a wifi connection! Running on Serial.");
        wifiConnected = false;
      }
  }
}
/*
void UDPCONNECTION::setupAsAP(const char* ssid,const char* passphrase = NULL){
  Serial.println("Setup microcontroller to a Access Point.");
  WiFi.mode(WIFI_AP);
  WiFi.softAP(ssid, passphrase);
  //WiFi.softAPConfig(local_ip, gateway, subnet);
  ipAddress = WiFi.softAPIP();
  Serial.println(ipAddress);
  server.begin();
  accessPointStatus = true;
  //wifiConnected = false;
  Serial.println("Esp configured as Acces Point.");
}
*/
void UDPCONNECTION::sendImuData(PACKET_ID imuPosition, char* data , uint8_t imuID){

    uint8_t count = writeHeader(imuPosition, imuID);
    memcpy(buffer + count, data, 100);
    count +=100;
    sendBuffer(imuPosition , sizeof(buffer));
    memset(&buffer[0], 0, sizeof(buffer));
}

uint8_t UDPCONNECTION::writeHeader(PACKET_ID imuPosition, uint8_t imuID){
    buffer[0] = imuPosition;
    //buffer[1] = imuID;
    return 1;
}

void UDPCONNECTION::sendBuffer(PACKET_ID imuPosition,uint8_t length){
  if(getStatusWifi() || getStatusAP()){
    wifiUdp.beginPacket(ipAddress, ipPort);
    wifiUdp.printf(buffer, length);
    wifiUdp.endPacket();

  }else{
    Serial.write(buffer);
    Serial.println("");
  }
}



bool UDPCONNECTION::getStatusWifi() const{
  return wifiConnected ;
}

bool UDPCONNECTION::getStatusAP() const{
  return accessPointStatus;
}
