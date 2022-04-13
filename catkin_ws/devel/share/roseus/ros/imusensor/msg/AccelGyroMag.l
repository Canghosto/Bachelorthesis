;; Auto-generated. Do not edit!


(when (boundp 'imusensor::AccelGyroMag)
  (if (not (find-package "IMUSENSOR"))
    (make-package "IMUSENSOR"))
  (shadow 'AccelGyroMag (find-package "IMUSENSOR")))
(unless (find-package "IMUSENSOR::ACCELGYROMAG")
  (make-package "IMUSENSOR::ACCELGYROMAG"))

(in-package "ROS")
;;//! \htmlinclude AccelGyroMag.msg.html


(defclass imusensor::AccelGyroMag
  :super ros::object
  :slots (_accelGyro _magnetometer_value ))

(defmethod imusensor::AccelGyroMag
  (:init
   (&key
    ((:accelGyro __accelGyro) (instance imusensor::AccelGyro :init))
    ((:magnetometer_value __magnetometer_value) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _accelGyro __accelGyro)
   (setq _magnetometer_value __magnetometer_value)
   self)
  (:accelGyro
   (&rest __accelGyro)
   (if (keywordp (car __accelGyro))
       (send* _accelGyro __accelGyro)
     (progn
       (if __accelGyro (setq _accelGyro (car __accelGyro)))
       _accelGyro)))
  (:magnetometer_value
   (&optional __magnetometer_value)
   (if __magnetometer_value (setq _magnetometer_value __magnetometer_value)) _magnetometer_value)
  (:serialization-length
   ()
   (+
    ;; imusensor/AccelGyro _accelGyro
    (send _accelGyro :serialization-length)
    ;; float64[3] _magnetometer_value
    (* 8    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; imusensor/AccelGyro _accelGyro
       (send _accelGyro :serialize s)
     ;; float64[3] _magnetometer_value
     (dotimes (i 3)
       (sys::poke (elt _magnetometer_value i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; imusensor/AccelGyro _accelGyro
     (send _accelGyro :deserialize buf ptr-) (incf ptr- (send _accelGyro :serialization-length))
   ;; float64[3] _magnetometer_value
   (dotimes (i (length _magnetometer_value))
     (setf (elt _magnetometer_value i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get imusensor::AccelGyroMag :md5sum-) "8e8da3dda6fbc637beb21b878c94fd9a")
(setf (get imusensor::AccelGyroMag :datatype-) "imusensor/AccelGyroMag")
(setf (get imusensor::AccelGyroMag :definition-)
      "AccelGyro accelGyro
float64[3] magnetometer_value

================================================================================
MSG: imusensor/AccelGyro
float32[3] accel
float32[3] gyro

")



(provide :imusensor/AccelGyroMag "8e8da3dda6fbc637beb21b878c94fd9a")


