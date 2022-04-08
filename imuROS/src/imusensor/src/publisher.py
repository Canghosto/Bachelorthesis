import rospy
import imusensor.msg as msg
import parser as dataParser


rospy.init_node('imuEvent', anonymous=True)
imu = rospy.Publisher('/imu_event', msg.ImuEvent, queue_size=10)
imuMag = rospy.Publisher('/imu_event_with_mag', msg.ImuEventMag)

udpStatus = rospy.get_param("~udpStatus", False)

while True:
    for data in dataParser.Parser(udpStatus):
        if rospy.is_shutdown():
            break
        if isinstance(data, dataParser.ImuEvent):
            imu.publish(rospy.Time.now(), data.imuId, msg.AccelGyro(data.accel, data.gyro))
        elif isinstance(data, dataParser.ImuEventMag):
            imuMag.publish(rospy.Time.now(), data.imuId, msg.AccelGyroMag(msg.AccelGyro(data.accel,data.gyro), data.magnetic_field_covariance))
