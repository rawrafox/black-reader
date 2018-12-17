module Black
  class TriColorSequencer < Black::Object
    array_reader(:functions)
    string_reader(:name)
    vector4_reader(:value)
  end
  
  class TriCurveSet < Black::Object
    array_reader(:bindings)
    array_reader(:curves)
    string_reader(:name)
    boolean_reader(:playOnLoad)
    array_reader(:ranges)
    float_reader(:scale)
    boolean_reader(:useSimTimeRebase)
  end

  class TriEventCurve < Black::Object
    uint_reader(:extrapolation)
    string_reader(:name)
    array_reader(:keys)
    ushort_reader(:value)
  end

  class TriEventKey < Black::Object
    float_reader(:time)
    ushort_reader(:value)
  end

  class TriFloat < Black::Object
    float_reader(:value)
  end

  class TriGeometryRes < Black::Object
  end

  class TriMatrix < Black::Object
    float_reader(:_11)
    float_reader(:_12)
    float_reader(:_13)
    float_reader(:_14)
    float_reader(:_21)
    float_reader(:_22)
    float_reader(:_23)
    float_reader(:_24)
    float_reader(:_31)
    float_reader(:_32)
    float_reader(:_33)
    float_reader(:_34)
    float_reader(:_41)
    float_reader(:_42)
    float_reader(:_43)
    float_reader(:_44)
  end

  class TriObserverLocal < Black::Object
    vector3_reader(:front)
  end

  class TriPerlinCurve < Black::Object
    float_reader(:alpha)
    float_reader(:beta)
    uint_reader(:N)
    string_reader(:name)
    float_reader(:offset)
    float_reader(:scale)
    float_reader(:speed)
    float_reader(:value)
  end

  class TriTextureParameter < Black::Object
    string_reader(:name)
    string_reader(:resourcePath)
  end
  
  class TriTransformParameter < Black::Object
    string_reader(:name)
    vector4_reader(:rotation)
  end
  
  class TriValueBinding < Black::Object
    object_reader(:destinationObject)
    string_reader(:destinationAttribute)
    string_reader(:name)
    vector4_reader(:offset)
    float_reader(:scale)
    object_reader(:sourceObject)
    string_reader(:sourceAttribute)
  end
  
  class TriVariableParameter < Black::Object
    string_reader(:name)
    string_reader(:variableName)
  end
end
