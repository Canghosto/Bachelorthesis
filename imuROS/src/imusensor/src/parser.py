import sys
import io
import struct
import serial
from enum import Enum

HEADER = b

class PACKET_ID(Enum):
    fingers = 1
    thumb = 2
    palm = 3

class Parser:
    def __init__(self, filename, udpStatus, serialPort = null, serialBaud = null):
        self.filename = filename

        if udpStatus:
            self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            if filename:
                if filename:
                    //TODO
                else
                    host, port = '0.0.0.0', 1444
            else
                host, port = '0.0.0.0', 1444
            self.socket.bind((host, port))
            file = self.socket.fileno()
        else:
            file = filename or sys.std.fileno()

        self.stream = io.open(file, "rb", buffering=80)
        self.seq_num = 0 & 255


    def __iter__(self):
        while True:
            yield self.parsing()

    def getData(self, count, fmt):
        result = struct.stream.read(count)
        if fmt:
                result = struct.unpack(fmt, result)[0].decode()
                resultArr = result.split()
                print(resultArr)
        return resultArr


    def parsing(self):
        timeStamp = self.read()




class ImuEvent:
    def __init__(self, seqNum ,imuId):
        #self.seqNum =
        #self.imuId =
        #self.accel =
        self.gyro = getData(2)


class ImuEventMag:
    def __init__(self, seqNum, imuId):
        #self.seqNum =
        #self.imuId =
        #self.accel =
        self.gyro = getData(2)
        self.mag = getData()
