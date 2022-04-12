#!/usr/bin/env python3

import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

import rospy
import imusensor.msg as msg
import mainparser as dataParser


rospy.init_node('imuEvent', anonymous=True)
imuValue_th = rospy.Publisher('/imu_event_th', msg.ImuEvent, queue_size=10)
imuValue_id = rospy.Publisher('/imu_event_id', msg.ImuEvent, queue_size=10)
imuValue_mf = rospy.Publisher('/imu_event_mf', msg.ImuEvent, queue_size=10)
imuValue_rf = rospy.Publisher('/imu_event_rf', msg.ImuEvent, queue_size=10)
imuValue_lf = rospy.Publisher('/imu_event_lf', msg.ImuEvent, queue_size=10)
imuValueMag = rospy.Publisher('/imu_event_core', msg.ImuEventMag, queue_size=10)

data_source = rospy.get_param("~data_source", None)
udpStatus = rospy.get_param("~udpStatus", False)
seq_num = 0 & 255

while True:
    for data in dataParser.Parser(data_source, udpStatus):
        if rospy.is_shutdown():
            break
        if isinstance(data, dataParser.ImuEvent_TH):
            imuValue_th.publish(rospy.Time.now(), data.seqNum, data.imuId, msg.AccelGyro(data.accel_value, data.gyro_value))
        elif isinstance(data, dataParser.ImuEvent_ID):
            imuValue_id.publish(rospy.Time.now(), data.seqNum, data.imuId, msg.AccelGyro(data.accel_value, data.gyro_value))
        elif isinstance(data, dataParser.ImuEvent_MF):
            imuValue_mf.publish(rospy.Time.now(), data.seqNum, data.imuId, msg.AccelGyro(data.accel_value, data.gyro_value))
        elif isinstance(data, dataParser.ImuEvent_RF):
            imuValue_rf.publish(rospy.Time.now(), data.seqNum, data.imuId, msg.AccelGyro(data.accel_value, data.gyro_value))
        elif isinstance(data, dataParser.ImuEvent_LF):
            imuValue_lf.publish(rospy.Time.now(), data.seqNum, data.imuId, msg.AccelGyro(data.accel_value, data.gyro_value))
        elif isinstance(data, dataParser.ImuEventMag):
            imuValueMag.publish(rospy.Time.now(),data.seqNum, data.imuId, msg.AccelGyroMag(msg.AccelGyro(data.accel_value,data.gyro_value), data.magnetometer_value))
