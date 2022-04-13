// Auto-generated. Do not edit!

// (in-package imusensor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AccelGyro = require('./AccelGyro.js');

//-----------------------------------------------------------

class AccelGyroMag {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.accelGyro = null;
      this.magnetometer_value = null;
    }
    else {
      if (initObj.hasOwnProperty('accelGyro')) {
        this.accelGyro = initObj.accelGyro
      }
      else {
        this.accelGyro = new AccelGyro();
      }
      if (initObj.hasOwnProperty('magnetometer_value')) {
        this.magnetometer_value = initObj.magnetometer_value
      }
      else {
        this.magnetometer_value = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AccelGyroMag
    // Serialize message field [accelGyro]
    bufferOffset = AccelGyro.serialize(obj.accelGyro, buffer, bufferOffset);
    // Check that the constant length array field [magnetometer_value] has the right length
    if (obj.magnetometer_value.length !== 3) {
      throw new Error('Unable to serialize array field magnetometer_value - length must be 3')
    }
    // Serialize message field [magnetometer_value]
    bufferOffset = _arraySerializer.float64(obj.magnetometer_value, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AccelGyroMag
    let len;
    let data = new AccelGyroMag(null);
    // Deserialize message field [accelGyro]
    data.accelGyro = AccelGyro.deserialize(buffer, bufferOffset);
    // Deserialize message field [magnetometer_value]
    data.magnetometer_value = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'imusensor/AccelGyroMag';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e8da3dda6fbc637beb21b878c94fd9a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    AccelGyro accelGyro
    float64[3] magnetometer_value
    
    ================================================================================
    MSG: imusensor/AccelGyro
    float32[3] accel
    float32[3] gyro
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AccelGyroMag(null);
    if (msg.accelGyro !== undefined) {
      resolved.accelGyro = AccelGyro.Resolve(msg.accelGyro)
    }
    else {
      resolved.accelGyro = new AccelGyro()
    }

    if (msg.magnetometer_value !== undefined) {
      resolved.magnetometer_value = msg.magnetometer_value;
    }
    else {
      resolved.magnetometer_value = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = AccelGyroMag;
