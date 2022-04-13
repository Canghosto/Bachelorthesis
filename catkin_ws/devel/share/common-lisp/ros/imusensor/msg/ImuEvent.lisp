; Auto-generated. Do not edit!


(cl:in-package imusensor-msg)


;//! \htmlinclude ImuEvent.msg.html

(cl:defclass <ImuEvent> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:real
    :initform 0)
   (seqNum
    :reader seqNum
    :initarg :seqNum
    :type cl:fixnum
    :initform 0)
   (imuId
    :reader imuId
    :initarg :imuId
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type imusensor-msg:AccelGyro
    :initform (cl:make-instance 'imusensor-msg:AccelGyro)))
)

(cl:defclass ImuEvent (<ImuEvent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImuEvent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImuEvent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imusensor-msg:<ImuEvent> is deprecated: use imusensor-msg:ImuEvent instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <ImuEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:time-val is deprecated.  Use imusensor-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'seqNum-val :lambda-list '(m))
(cl:defmethod seqNum-val ((m <ImuEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:seqNum-val is deprecated.  Use imusensor-msg:seqNum instead.")
  (seqNum m))

(cl:ensure-generic-function 'imuId-val :lambda-list '(m))
(cl:defmethod imuId-val ((m <ImuEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:imuId-val is deprecated.  Use imusensor-msg:imuId instead.")
  (imuId m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ImuEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:data-val is deprecated.  Use imusensor-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImuEvent>) ostream)
  "Serializes a message object of type '<ImuEvent>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time) (cl:floor (cl:slot-value msg 'time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seqNum)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imuId)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImuEvent>) istream)
  "Deserializes a message object of type '<ImuEvent>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seqNum)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imuId)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImuEvent>)))
  "Returns string type for a message object of type '<ImuEvent>"
  "imusensor/ImuEvent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImuEvent)))
  "Returns string type for a message object of type 'ImuEvent"
  "imusensor/ImuEvent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImuEvent>)))
  "Returns md5sum for a message object of type '<ImuEvent>"
  "0fe43237e9123a79e97b4f36de9d49e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImuEvent)))
  "Returns md5sum for a message object of type 'ImuEvent"
  "0fe43237e9123a79e97b4f36de9d49e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImuEvent>)))
  "Returns full string definition for message of type '<ImuEvent>"
  (cl:format cl:nil "time time~%uint8 seqNum~%uint8 imuId~%AccelGyro data~%~%================================================================================~%MSG: imusensor/AccelGyro~%float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImuEvent)))
  "Returns full string definition for message of type 'ImuEvent"
  (cl:format cl:nil "time time~%uint8 seqNum~%uint8 imuId~%AccelGyro data~%~%================================================================================~%MSG: imusensor/AccelGyro~%float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImuEvent>))
  (cl:+ 0
     8
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImuEvent>))
  "Converts a ROS message object to a list"
  (cl:list 'ImuEvent
    (cl:cons ':time (time msg))
    (cl:cons ':seqNum (seqNum msg))
    (cl:cons ':imuId (imuId msg))
    (cl:cons ':data (data msg))
))
