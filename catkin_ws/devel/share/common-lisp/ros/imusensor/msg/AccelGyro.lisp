; Auto-generated. Do not edit!


(cl:in-package imusensor-msg)


;//! \htmlinclude AccelGyro.msg.html

(cl:defclass <AccelGyro> (roslisp-msg-protocol:ros-message)
  ((accel
    :reader accel
    :initarg :accel
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (gyro
    :reader gyro
    :initarg :gyro
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass AccelGyro (<AccelGyro>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AccelGyro>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AccelGyro)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imusensor-msg:<AccelGyro> is deprecated: use imusensor-msg:AccelGyro instead.")))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <AccelGyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:accel-val is deprecated.  Use imusensor-msg:accel instead.")
  (accel m))

(cl:ensure-generic-function 'gyro-val :lambda-list '(m))
(cl:defmethod gyro-val ((m <AccelGyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imusensor-msg:gyro-val is deprecated.  Use imusensor-msg:gyro instead.")
  (gyro m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AccelGyro>) ostream)
  "Serializes a message object of type '<AccelGyro>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'accel))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'gyro))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AccelGyro>) istream)
  "Deserializes a message object of type '<AccelGyro>"
  (cl:setf (cl:slot-value msg 'accel) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'accel)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'gyro) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'gyro)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AccelGyro>)))
  "Returns string type for a message object of type '<AccelGyro>"
  "imusensor/AccelGyro")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AccelGyro)))
  "Returns string type for a message object of type 'AccelGyro"
  "imusensor/AccelGyro")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AccelGyro>)))
  "Returns md5sum for a message object of type '<AccelGyro>"
  "063d41f75cc2a42677d200b5fb1fbffc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AccelGyro)))
  "Returns md5sum for a message object of type 'AccelGyro"
  "063d41f75cc2a42677d200b5fb1fbffc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AccelGyro>)))
  "Returns full string definition for message of type '<AccelGyro>"
  (cl:format cl:nil "float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AccelGyro)))
  "Returns full string definition for message of type 'AccelGyro"
  (cl:format cl:nil "float32[3] accel~%float32[3] gyro~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AccelGyro>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'accel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'gyro) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AccelGyro>))
  "Converts a ROS message object to a list"
  (cl:list 'AccelGyro
    (cl:cons ':accel (accel msg))
    (cl:cons ':gyro (gyro msg))
))
