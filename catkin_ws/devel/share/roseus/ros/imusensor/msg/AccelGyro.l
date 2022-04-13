;; Auto-generated. Do not edit!


(when (boundp 'imusensor::AccelGyro)
  (if (not (find-package "IMUSENSOR"))
    (make-package "IMUSENSOR"))
  (shadow 'AccelGyro (find-package "IMUSENSOR")))
(unless (find-package "IMUSENSOR::ACCELGYRO")
  (make-package "IMUSENSOR::ACCELGYRO"))

(in-package "ROS")
;;//! \htmlinclude AccelGyro.msg.html


(defclass imusensor::AccelGyro
  :super ros::object
  :slots (_accel _gyro ))

(defmethod imusensor::AccelGyro
  (:init
   (&key
    ((:accel __accel) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:gyro __gyro) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _accel __accel)
   (setq _gyro __gyro)
   self)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:gyro
   (&optional __gyro)
   (if __gyro (setq _gyro __gyro)) _gyro)
  (:serialization-length
   ()
   (+
    ;; float32[3] _accel
    (* 4    3)
    ;; float32[3] _gyro
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _accel
     (dotimes (i 3)
       (sys::poke (elt _accel i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _gyro
     (dotimes (i 3)
       (sys::poke (elt _gyro i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _accel
   (dotimes (i (length _accel))
     (setf (elt _accel i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _gyro
   (dotimes (i (length _gyro))
     (setf (elt _gyro i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get imusensor::AccelGyro :md5sum-) "063d41f75cc2a42677d200b5fb1fbffc")
(setf (get imusensor::AccelGyro :datatype-) "imusensor/AccelGyro")
(setf (get imusensor::AccelGyro :definition-)
      "float32[3] accel
float32[3] gyro

")



(provide :imusensor/AccelGyro "063d41f75cc2a42677d200b5fb1fbffc")


