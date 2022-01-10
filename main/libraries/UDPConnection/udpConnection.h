#ifndef _UDPCONNECTION_H
#define _UDPCONNECTION_H

#include "Arduino.h"
#include "WiFi.h"
#include "WiFiUdp.h"
//#include "WebServer.h"
//#include "DNSServer.h"
//#include "WiFiAP.h"


class UDPCONNECTION {
public:
    UDPCONNECTION();
    enum PACKET_ID {
            fingers = 1,
            thumb,
            palm
        };
    
    void setupWiFi(const char* ssid,
                              const char* passphrase,
                              const IPAddress& ip,
                              const uint16_t targetPort,
                              const char* username);
                              
    /*
    void setupAsAP(const char* ssid,const char* passphrase);
    */
    void sendImuData(PACKET_ID imuPosition, char* data, uint8_t imuID);
    bool getStatusWifi() const;
    bool getStatusAP() const;
    uint8_t writeHeader(PACKET_ID packetID, uint8_t imuID);


private:
    void sendBuffer(PACKET_ID imuPosition, uint8_t length);
    bool wifiConnected;
    bool accessPointStatus;
    IPAddress ipAddress;
    //WebServer server;
    uint16_t ipPort;
    char buffer[100];
    char palmBuffer[150];
    WiFiUDP wifiUdp;

};

#endif
