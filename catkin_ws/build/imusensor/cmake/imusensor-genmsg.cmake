# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "imusensor: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iimusensor:/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(imusensor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_custom_target(_imusensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imusensor" "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" ""
)

get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_custom_target(_imusensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imusensor" "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" "imusensor/AccelGyro"
)

get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_custom_target(_imusensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imusensor" "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" "imusensor/AccelGyro"
)

get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_custom_target(_imusensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imusensor" "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" "imusensor/AccelGyro:imusensor/AccelGyroMag"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
)
_generate_msg_cpp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
)
_generate_msg_cpp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
)
_generate_msg_cpp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg;/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
)

### Generating Services

### Generating Module File
_generate_module_cpp(imusensor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(imusensor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(imusensor_generate_messages imusensor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_cpp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_cpp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_cpp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_cpp _imusensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imusensor_gencpp)
add_dependencies(imusensor_gencpp imusensor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imusensor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
)
_generate_msg_eus(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
)
_generate_msg_eus(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
)
_generate_msg_eus(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg;/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
)

### Generating Services

### Generating Module File
_generate_module_eus(imusensor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(imusensor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(imusensor_generate_messages imusensor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_eus _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_eus _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_eus _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_eus _imusensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imusensor_geneus)
add_dependencies(imusensor_geneus imusensor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imusensor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
)
_generate_msg_lisp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
)
_generate_msg_lisp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
)
_generate_msg_lisp(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg;/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
)

### Generating Services

### Generating Module File
_generate_module_lisp(imusensor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(imusensor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(imusensor_generate_messages imusensor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_lisp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_lisp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_lisp _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_lisp _imusensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imusensor_genlisp)
add_dependencies(imusensor_genlisp imusensor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imusensor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
)
_generate_msg_nodejs(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
)
_generate_msg_nodejs(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
)
_generate_msg_nodejs(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg;/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(imusensor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(imusensor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(imusensor_generate_messages imusensor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_nodejs _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_nodejs _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_nodejs _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_nodejs _imusensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imusensor_gennodejs)
add_dependencies(imusensor_gennodejs imusensor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imusensor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
)
_generate_msg_py(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
)
_generate_msg_py(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
)
_generate_msg_py(imusensor
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg"
  "${MSG_I_FLAGS}"
  "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg;/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
)

### Generating Services

### Generating Module File
_generate_module_py(imusensor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(imusensor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(imusensor_generate_messages imusensor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyro.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_py _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/AccelGyroMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_py _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEvent.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_py _imusensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/can/Schreibtisch/Bachelorthesis/catkin_ws/src/imusensor/msg/ImuEventMag.msg" NAME_WE)
add_dependencies(imusensor_generate_messages_py _imusensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imusensor_genpy)
add_dependencies(imusensor_genpy imusensor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imusensor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imusensor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(imusensor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(imusensor_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imusensor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(imusensor_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(imusensor_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imusensor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(imusensor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(imusensor_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imusensor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(imusensor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(imusensor_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imusensor
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(imusensor_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(imusensor_generate_messages_py sensor_msgs_generate_messages_py)
endif()
