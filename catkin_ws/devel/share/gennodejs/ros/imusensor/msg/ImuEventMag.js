// Auto-generated. Do not edit!

// (in-package imusensor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AccelGyroMag = require('./AccelGyroMag.js');

//-----------------------------------------------------------

class ImuEventMag {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time = null;
      this.seqNum = null;
      this.imuId = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('seqNum')) {
        this.seqNum = initObj.seqNum
      }
      else {
        this.seqNum = 0;
      }
      if (initObj.hasOwnProperty('imuId')) {
        this.imuId = initObj.imuId
      }
      else {
        this.imuId = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new AccelGyroMag();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImuEventMag
    // Serialize message field [time]
    bufferOffset = _serializer.time(obj.time, buffer, bufferOffset);
    // Serialize message field [seqNum]
    bufferOffset = _serializer.uint8(obj.seqNum, buffer, bufferOffset);
    // Serialize message field [imuId]
    bufferOffset = _serializer.uint8(obj.imuId, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = AccelGyroMag.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImuEventMag
    let len;
    let data = new ImuEventMag(null);
    // Deserialize message field [time]
    data.time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [seqNum]
    data.seqNum = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [imuId]
    data.imuId = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = AccelGyroMag.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 58;
  }

  static datatype() {
    // Returns string type for a message object
    return 'imusensor/ImuEventMag';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7545afec4862898e43946844ce5bcea9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time time
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImuEventMag(null);
    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = {secs: 0, nsecs: 0}
    }

    if (msg.seqNum !== undefined) {
      resolved.seqNum = msg.seqNum;
    }
    else {
      resolved.seqNum = 0
    }

    if (msg.imuId !== undefined) {
      resolved.imuId = msg.imuId;
    }
    else {
      resolved.imuId = 0
    }

    if (msg.data !== undefined) {
      resolved.data = AccelGyroMag.Resolve(msg.data)
    }
    else {
      resolved.data = new AccelGyroMag()
    }

    return resolved;
    }
};

module.exports = ImuEventMag;
