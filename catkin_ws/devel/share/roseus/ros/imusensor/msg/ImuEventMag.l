;; Auto-generated. Do not edit!


(when (boundp 'imusensor::ImuEventMag)
  (if (not (find-package "IMUSENSOR"))
    (make-package "IMUSENSOR"))
  (shadow 'ImuEventMag (find-package "IMUSENSOR")))
(unless (find-package "IMUSENSOR::IMUEVENTMAG")
  (make-package "IMUSENSOR::IMUEVENTMAG"))

(in-package "ROS")
;;//! \htmlinclude ImuEventMag.msg.html


(defclass imusensor::ImuEventMag
  :super ros::object
  :slots (_time _seqNum _imuId _data ))

(defmethod imusensor::ImuEventMag
  (:init
   (&key
    ((:time __time) (instance ros::time :init))
    ((:seqNum __seqNum) 0)
    ((:imuId __imuId) 0)
    ((:data __data) (instance imusensor::AccelGyroMag :init))
    )
   (send-super :init)
   (setq _time __time)
   (setq _seqNum (round __seqNum))
   (setq _imuId (round __imuId))
   (setq _data __data)
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:seqNum
   (&optional __seqNum)
   (if __seqNum (setq _seqNum __seqNum)) _seqNum)
  (:imuId
   (&optional __imuId)
   (if __imuId (setq _imuId __imuId)) _imuId)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; time _time
    8
    ;; uint8 _seqNum
    1
    ;; uint8 _imuId
    1
    ;; imusensor/AccelGyroMag _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _time
       (write-long (send _time :sec) s) (write-long (send _time :nsec) s)
     ;; uint8 _seqNum
       (write-byte _seqNum s)
     ;; uint8 _imuId
       (write-byte _imuId s)
     ;; imusensor/AccelGyroMag _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _time
     (send _time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _seqNum
     (setq _seqNum (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _imuId
     (setq _imuId (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; imusensor/AccelGyroMag _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get imusensor::ImuEventMag :md5sum-) "7545afec4862898e43946844ce5bcea9")
(setf (get imusensor::ImuEventMag :datatype-) "imusensor/ImuEventMag")
(setf (get imusensor::ImuEventMag :definition-)
      "time time
uint8 seqNum
uint8 imuId
AccelGyroMag data

================================================================================
MSG: imusensor/AccelGyroMag
AccelGyro accelGyro
float64[3] magnetometer_value

================================================================================
MSG: imusensor/AccelGyro
float32[3] accel
float32[3] gyro

")



(provide :imusensor/ImuEventMag "7545afec4862898e43946844ce5bcea9")


