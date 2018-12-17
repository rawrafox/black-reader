class WodPlaceableRes < Black::Object
  float_reader(:farFadeDistance)
  float_reader(:nearFadeDistance)
  object_reader(:visualModel)
end
