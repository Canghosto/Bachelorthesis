#!/usr/bin/env python3

import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

import os, sys, rospy, tf, itertools
import imutype.msg as imutype_msgs
from geometry_msgs.msg import Quaternion, Vector3
from std_msgs.msg import Header
import sensor_msgs.msg as sensor_msgs

COVARIANC_IDENTITY = (1,0,0,0,1,0,0,0,1)

rospy.init_node('imuEventConverter', anonymous=True)


imuValue_th_converted = rospy.Publisher('/imu_event_th_converted', sensor_msgs.Imu, queue_size=10)
imuValue_id_converted = rospy.Publisher('/imu_event_id_converted', sensor_msgs.Imu, queue_size=10)
imuValue_mf_converted = rospy.Publisher('/imu_event_mf_converted', sensor_msgs.Imu, queue_size=10)
imuValue_rf_converted = rospy.Publisher('/imu_event_rf_converted', sensor_msgs.Imu, queue_size=10)
imuValue_lf_converted = rospy.Publisher('/imu_event_lf_converted', sensor_msgs.Imu, queue_size=10)
imuValue_core_converted = rospy.Publisher('/imu_event_core_converted', sensor_msgs.Imu, queue_size=10)
imuValue_core_converted_mag = rospy.Publisher('/imu_event_core_converted_mag', sensor_msgs.MagneticField, queue_size=10)

data_source = rospy.get_param("~data_source", None)
udpStatus = rospy.get_param("~udpStatus", False)
seq_num = 0 & 255

while True:
    for data in dataParser.Parser(data_source, udpStatus):
        if rospy.is_shutdown():
            break
        if isinstance(data, dataParser.ImuEvent_TH):
            imuValue_th_converted.publish(converted_imu_event(self, data, data.imuId))
        elif isinstance(data, dataParser.ImuEvent_ID):
            imuValue_id_converted.publish(converted_imu_event(self, data, data.imuId))
        elif isinstance(data, dataParser.ImuEvent_MF):
            imuValue_mf_converted.publish(converted_imu_event(self, data, data.imuId))
        elif isinstance(data, dataParser.ImuEvent_RF):
            imuValue_rf_converted.publish(converted_imu_event(self, data, data.imuId))
        elif isinstance(data, dataParser.ImuEvent_LF):
            imuValue_lf_converted.publish(converted_imu_event(self, data, data.imuId))
        elif isinstance(data, dataParser.ImuEventMag):
            imuValue_core_converted.publish(converted_imu_event(self, data, data.imuId))
            imuValue_core_converted_mag.publish(converted_imu_event_mag(self, data, data.imuId))


def converted_imu_event(self, unfilteredData, id):

    self.orientation.w = 0.0;
    self.orientation.x = 0.0;
    self.orientation.y = 0.0;
    self.orientation.z = 1.0;

    return imuMSG = {
        HEADER(
            unfilteredData.seqNum,
            rospy.Time.now(),
            unfilteredData.imuId
        ),

        Quaternion(self.orientation.w ,self.orientation.x ,self.orientation.y ,self.orientation.z),
        COVARIANC_IDENTITY,

        Vector3(unfilteredData.gyro_value),
        COVARIANC_IDENTITY,

        Vector3(unfilteredData.accel_value),
        COVARIANC_IDENTITY
    }


def converted_imu_event_mag(self, unfilteredData, id):

    return imuMSG_Mag = {
        HEADER(
            unfilteredData.seqNum,
            rospy.Time.now(),
            unfilteredData.imuId
        ),
        unfilteredData.magnetometer_value
    }
