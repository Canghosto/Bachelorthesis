# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from imusensor/AccelGyroMag.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import imusensor.msg

class AccelGyroMag(genpy.Message):
  _md5sum = "8e8da3dda6fbc637beb21b878c94fd9a"
  _type = "imusensor/AccelGyroMag"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """AccelGyro accelGyro
float64[3] magnetometer_value

================================================================================
MSG: imusensor/AccelGyro
float32[3] accel
float32[3] gyro
"""
  __slots__ = ['accelGyro','magnetometer_value']
  _slot_types = ['imusensor/AccelGyro','float64[3]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       accelGyro,magnetometer_value

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AccelGyroMag, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.accelGyro is None:
        self.accelGyro = imusensor.msg.AccelGyro()
      if self.magnetometer_value is None:
        self.magnetometer_value = [0.] * 3
    else:
      self.accelGyro = imusensor.msg.AccelGyro()
      self.magnetometer_value = [0.] * 3

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
      buff.write(_get_struct_3f().pack(*self.accelGyro.accel))
      buff.write(_get_struct_3f().pack(*self.accelGyro.gyro))
      buff.write(_get_struct_3d().pack(*self.magnetometer_value))
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
      if self.accelGyro is None:
        self.accelGyro = imusensor.msg.AccelGyro()
      end = 0
      start = end
      end += 12
      self.accelGyro.accel = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 12
      self.accelGyro.gyro = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 24
      self.magnetometer_value = _get_struct_3d().unpack(str[start:end])
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
      buff.write(self.accelGyro.accel.tostring())
      buff.write(self.accelGyro.gyro.tostring())
      buff.write(self.magnetometer_value.tostring())
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
      if self.accelGyro is None:
        self.accelGyro = imusensor.msg.AccelGyro()
      end = 0
      start = end
      end += 12
      self.accelGyro.accel = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 12
      self.accelGyro.gyro = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 24
      self.magnetometer_value = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=3)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
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
