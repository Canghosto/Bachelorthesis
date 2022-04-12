import sys
import io
import struct
import serial
import rospy
import socket
from enum import Enum

class EndOfStream(Exception):
    pass

#HEADER = b

class PACKET_ID(Enum):
    fingers = '\x01'
    thumb = '\x02'
    palm = '\x03'

class Parser:
    def __init__(self, filename, udpStatus = False):
        if udpStatus:
            ip_port = 8080
            if rospy.has_param('~ip_port'):
                ip_port = rospy.get_param('ip_port')
            ip_address = '192.168.178.25'
            if rospy.has_param('~ip_address'):
                ip_address = rospy.get_param('ip_address')
            self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            self.socket = self.socket.bind((ip_address, ip_port))
        else:
            port_name = '/dev/ttyUSB0'
            if rospy.has_param( '~port_name' ):
                port_name = rospy.get_param( '~port_name' )
            baudrate = 115200   # ignored anyway, we use native-USB microcontroller
            if rospy.has_param( '~baudrate' ):
                baudrate = rospy.get_param( '~baudrate' )

            self.ser = serial.Serial(port_name, baudrate = baudrate)

        self.seq_num = 0 & 255


    def __iter__(self):
        try:
            while True:
                if self.ser != None:
                    data = self.ser.readline()
                    data = data.decode().split()
                    print(data)
                    if data[0] == '\x01' or data[0]== '\x03':
                        yield self.parsing(data)
                else:
                    data = self.socket.recvfrom(1024)
                    data = data.decode().split()
                    print(data)
                    if data[0] == '\x01' or data[0]== '\x03':
                        yield self.parsing(data)

        except EndOfStream:
            pass

    def parsing(self, data):
        if data[0] == '\x01':
            (packet_id, seq_number, imu_index,
             str_accel, ax, ay, az, str_gyro, gx, gy, gz ) = \
            [t(s) for t,s in zip(( PACKET_ID, int, int,
                                    str, float, float, float, str, float, float, float ), data )]
            accelValues = [ax,ay,az]
            gyroValues = [gx,gy,gz]
            if imu_index == 1:
                result = ImuEvent_TH(seq_number, 1, accelValues, gyroValues)
            elif imu_index == 2:
                result = ImuEvent_ID(seq_number, 2, accelValues, gyroValues)
            elif imu_index == 3:
                result = ImuEvent_MF(seq_number, 3, accelValues, gyroValues)
            elif imu_index == 4:
                result = ImuEvent_RF(seq_number, 4, accelValues, gyroValues)
            elif imu_index == 5:
                result = ImuEvent_LF(seq_number, 5, accelValues, gyroValues)

        elif data[0]== '\x03':
            (packet_id, seq_number, imu_index,
             str_accel, ax, ay, az, str_gyro, gx, gy, gz, str_mag, mx, my, mz) = \
            [t(s) for t,s in zip(( PACKET_ID, int, int,
                                   str, float, float, float, str, float, float, float , str, float, float, float ), data) ]
            accelValues = [ax,ay,az]
            gyroValues = [gx,gy,gz]
            magValues = [mx,my,mz]
            result = ImuEventMag(seq_number, 0, accelValues, gyroValues, magValues)
        else:
            raise Exception('Invalid Header')

        return result





class ImuEvent_TH:
    def __init__(self, seqNum, imuId, accelList, gyroList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList

class ImuEvent_ID:
    def __init__(self, seqNum, imuId, accelList, gyroList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList


class ImuEvent_MF:
    def __init__(self, seqNum, imuId, accelList, gyroList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList

class ImuEvent_RF:
    def __init__(self, seqNum, imuId, accelList, gyroList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList

class ImuEvent_LF:
    def __init__(self, seqNum, imuId, accelList, gyroList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList

class ImuEventMag:
    def __init__(self, seqNum, imuId, accelList, gyroList, magList):
        self.seqNum = seqNum
        self.imuId = imuId
        self.accel_value = accelList
        self.gyro_value = gyroList
        self.magnetometer_value = magList
