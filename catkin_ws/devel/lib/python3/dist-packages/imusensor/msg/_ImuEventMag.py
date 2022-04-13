# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from imusensor/ImuEventMag.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import imusensor.msg

class ImuEventMag(genpy.Message):
  _md5sum = "7545afec4862898e43946844ce5bcea9"
  _type = "imusensor/ImuEventMag"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """time time
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
"""
  __slots__ = ['time','seqNum','imuId','data']
  _slot_types = ['time','uint8','uint8','imusensor/AccelGyroMag']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       time,seqNum,imuId,data

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ImuEventMag, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.time is None:
        self.time = genpy.Time()
      if self.seqNum is None:
        self.seqNum = 0
      if self.imuId is None:
        self.imuId = 0
      if self.data is None:
        self.data = imusensor.msg.AccelGyroMag()
    else:
      self.time = genpy.Time()
      self.seqNum = 0
      self.imuId = 0
      self.data = imusensor.msg.AccelGyroMag()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2I2B().pack(_x.time.secs, _x.time.nsecs, _x.seqNum, _x.imuId))
      buff.write(_get_struct_3f().pack(*self.data.accelGyro.accel))
      buff.write(_get_struct_3f().pack(*self.data.accelGyro.gyro))
      buff.write(_get_struct_3d().pack(*self.data.magnetometer_value))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.time is None:
        self.time = genpy.Time()
      if self.data is None:
        self.data = imusensor.msg.AccelGyroMag()
      end = 0
      _x = self
      start = end
      end += 10
      (_x.time.secs, _x.time.nsecs, _x.seqNum, _x.imuId,) = _get_struct_2I2B().unpack(str[start:end])
      start = end
      end += 12
      self.data.accelGyro.accel = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 12
      self.data.accelGyro.gyro = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 24
      self.data.magnetometer_value = _get_struct_3d().unpack(str[start:end])
      self.time.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2I2B().pack(_x.time.secs, _x.time.nsecs, _x.seqNum, _x.imuId))
      buff.write(self.data.accelGyro.accel.tostring())
      buff.write(self.data.accelGyro.gyro.tostring())
      buff.write(self.data.magnetometer_value.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.time is None:
        self.time = genpy.Time()
      if self.data is None:
        self.data = imusensor.msg.AccelGyroMag()
      end = 0
      _x = self
      start = end
      end += 10
      (_x.time.secs, _x.time.nsecs, _x.seqNum, _x.imuId,) = _get_struct_2I2B().unpack(str[start:end])
      start = end
      end += 12
      self.data.accelGyro.accel = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 12
      self.data.accelGyro.gyro = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 24
      self.data.magnetometer_value = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=3)
      self.time.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I2B = None
def _get_struct_2I2B():
    global _struct_2I2B
    if _struct_2I2B is None:
        _struct_2I2B = struct.Struct("<2I2B")
    return _struct_2I2B
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
