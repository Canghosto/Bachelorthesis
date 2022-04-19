#!/usr/bin/env python3

import os, sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

import math
import rospy, tf
import imusensor.msg as msg
import mainparser as dataParser
from sensor_msgs.msg import Imu, MagneticField

COVARIANCE_IDENTITY = (1, 0, 0, 0, 1, 0, 0, 0, 1)

DEG2RAD = math.pi / 180.0
RAD2DEG =  180 / math.pi

rospy.init_node('imuEventConverter', anonymous=True)
imuValue_th_converted = rospy.Publisher('/imu_event_th_converted/imu/data_raw', Imu, queue_size=10)
imuValue_if_converted = rospy.Publisher('/imu_event_if_converted/imu/data_raw', Imu, queue_size=10)
imuValue_mf_converted = rospy.Publisher('/imu_event_mf_converted/imu/data_raw', Imu, queue_size=10)
imuValue_rf_converted = rospy.Publisher('/imu_event_rf_converted/imu/data_raw', Imu, queue_size=10)
imuValue_lf_converted = rospy.Publisher('/imu_event_lf_converted/imu/data_raw', Imu, queue_size=10)
imuValue_core_converted = rospy.Publisher('/imu_event_core_converted/imu/data_raw', Imu, queue_size=10)
imuValue_core_converted_mag = rospy.Publisher('/imu_event_core_converted_mag/imu/mag', MagneticField, queue_size=10)

udpStatus = rospy.get_param("~udpStatus", True)
seq_num = 0 & 255

while True:
    for data in dataParser.Parser(udpStatus):
        time = rospy.Time.now()
        accel_gyro = Imu()
        accel_gyro.header.seq = data.seqNum
        accel_gyro.header.stamp = time
        accel_gyro.header.frame_id = str(data.imuId)
        accel_gyro.angular_velocity.x = data.gyro_value[0] * DEG2RAD
        accel_gyro.angular_velocity.y = data.gyro_value[1] * DEG2RAD
        accel_gyro.angular_velocity.z = data.gyro_value[2] * DEG2RAD
#        accel_gyro.angular_velocity_covariance = COVARIANCE_IDENTITY
        accel_gyro.linear_acceleration.x = data.accel_value[0]
        accel_gyro.linear_acceleration.y = data.accel_value[1]
        accel_gyro.linear_acceleration.z = data.accel_value[2]
#        accel_gyro.linear_acceleration_covariance = COVARIANCE_IDENTITY
        if rospy.is_shutdown():
            break
        if isinstance(data, dataParser.ImuEvent_TH):
            imuValue_th_converted.publish(accel_gyro)
        elif isinstance(data, dataParser.ImuEvent_IF):
            imuValue_if_converted.publish(accel_gyro)
        elif isinstance(data, dataParser.ImuEvent_MF):
            imuValue_mf_converted.publish(accel_gyro)
        elif isinstance(data, dataParser.ImuEvent_RF):
            imuValue_rf_converted.publish(accel_gyro)
        elif isinstance(data, dataParser.ImuEvent_LF):
            imuValue_lf_converted.publish(accel_gyro)
        elif isinstance(data, dataParser.ImuEventMag):
            mag = MagneticField()
            mag.header.seq = data.seqNum
            mag.header.stamp = time
            mag.header.frame_id = str(data.imuId)
            mag.magnetic_field.x = data.magnetometer_value[0]
            mag.magnetic_field.y = data.magnetometer_value[1]
            mag.magnetic_field.z = data.magnetometer_value[2]
            imuValue_core_converted.publish(accel_gyro)
            imuValue_core_converted_mag.publish(mag)
