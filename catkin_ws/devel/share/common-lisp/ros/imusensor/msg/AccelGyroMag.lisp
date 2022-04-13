; Auto-generated. Do not edit!


(cl:in-package imusensor-msg)


;//! \htmlinclude AccelGyroMag.msg.html

(cl:defclass <AccelGyroMag> (roslisp-msg-protocol:ros-message)
  ((accelGyro
    :reader accelGyro
    :initarg :accelGyro
    :type imusensor-msg:AccelGyro
    :initform (cl:make-instance 'imusensor-msg:AccelGyro))
   (magnetometer_value
    :reader magnetometer_value
    :initarg :magnetometer_value
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass AccelGyroMag (<AccelGyroMag>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AccelGyroMag>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AccelGyroMag)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imusensor-msg:<AccelGyroMag> is deprecated: use imusensor-msg:AccelGyroMag instead.")))

(cl:ensure-generic-function 'accelGyro-val :lambda-list '(m))
(cl:defmethod accelGyro-val ((m <AccelGyroMag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:accelGyro-val is deprecated.  Use imusensor-msg:accelGyro instead.")
  (accelGyro m))

(cl:ensure-generic-function 'magnetometer_value-val :lambda-list '(m))
(cl:defmethod magnetometer_value-val ((m <AccelGyroMag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:magnetometer_value-val is deprecated.  Use imusensor-msg:magnetometer_value instead.")
  (magnetometer_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AccelGyroMag>) ostream)
  "Serializes a message object of type '<AccelGyroMag>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'accelGyro) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'magnetometer_value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AccelGyroMag>) istream)
  "Deserializes a message object of type '<AccelGyroMag>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'accelGyro) istream)
  (cl:setf (cl:slot-value msg 'magnetometer_value) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'magnetometer_value)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AccelGyroMag>)))
  "Returns string type for a message object of type '<AccelGyroMag>"
  "imusensor/AccelGyroMag")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AccelGyroMag)))
  "Returns string type for a message object of type 'AccelGyroMag"
  "imusensor/AccelGyroMag")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AccelGyroMag>)))
  "Returns md5sum for a message object of type '<AccelGyroMag>"
  "8e8da3dda6fbc637beb21b878c94fd9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AccelGyroMag)))
  "Returns md5sum for a message object of type 'AccelGyroMag"
  "8e8da3dda6fbc637beb21b878c94fd9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AccelGyroMag>)))
  "Returns full string definition for message of type '<AccelGyroMag>"
  (cl:format cl:nil "AccelGyro accelGyro~%float64[3] magnetometer_value~%~%================================================================================~%MSG: imusensor/AccelGyro~%float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AccelGyroMag)))
  "Returns full string definition for message of type 'AccelGyroMag"
  (cl:format cl:nil "AccelGyro accelGyro~%float64[3] magnetometer_value~%~%================================================================================~%MSG: imusensor/AccelGyro~%float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AccelGyroMag>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'accelGyro))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'magnetometer_value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AccelGyroMag>))
  "Converts a ROS message object to a list"
  (cl:list 'AccelGyroMag
    (cl:cons ':accelGyro (accelGyro msg))
    (cl:cons ':magnetometer_value (magnetometer_value msg))
))
