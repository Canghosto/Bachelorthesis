
(cl:in-package :asdf)

(defsystem "imusensor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AccelGyro" :depends-on ("_package_AccelGyro"))
    (:file "_package_AccelGyro" :depends-on ("_package"))
    (:file "AccelGyroMag" :depends-on ("_package_AccelGyroMag"))
    (:file "_package_AccelGyroMag" :depends-on ("_package"))
    (:file "ImuEvent" :depends-on ("_package_ImuEvent"))
    (:file "_package_ImuEvent" :depends-on ("_package"))
    (:file "ImuEventMag" :depends-on ("_package_ImuEventMag"))
    (:file "_package_ImuEventMag" :depends-on ("_package"))
  ))