module Black
  class AudEventCurve < Black::Object
    uint_reader(:extrapolation)
    array_reader(:keys)
    string_reader(:name)
    object_reader(:sourceTriObserver)
  end

  class AudEventKey < Black::Object
    float_reader(:time)
    ushort_reader(:value)
  end
end
