module Black
  class EveSOFData < Black::Object
    array_reader(:faction)
    object_reader(:generic)
    array_reader(:hull)
    array_reader(:material)
    array_reader(:pattern)
    array_reader(:race)
  end
  
  class EveSOFDataArea < Black::Object
    object_reader(:Black)
    object_reader(:Blue)
    object_reader(:Booster)
    object_reader(:Cyan)
    object_reader(:Darkhull)
    object_reader(:Fire)
    object_reader(:Glass)
    object_reader(:Green)
    object_reader(:Hull)
    object_reader(:Killmark)
    object_reader(:Orange)
    object_reader(:Primary)
    object_reader(:Reactor)
    object_reader(:Red)
    object_reader(:Rock)
    object_reader(:Sails)
    object_reader(:Secondary)
    object_reader(:Tertiary)
    object_reader(:White)
    object_reader(:Yellow)
  end
  
  class EveSOFDataAreaMaterial < Black::Object
    uint_reader(:colorType)
    string_reader(:material1)
    string_reader(:material2)
    string_reader(:material3)
    string_reader(:material4)
  end
  
  class EveSOFDataBooster < Black::Object
    vector4_reader(:glowColor)
    float_reader(:glowScale)
    string_reader(:gradient0ResPath)
    string_reader(:gradient1ResPath)
    vector4_reader(:haloColor)
    float_reader(:haloScaleX)
    float_reader(:haloScaleY)
    float_reader(:lightFlickerAmplitude)
    vector4_reader(:lightFlickerColor)
    float_reader(:lightFlickerFrequency)
    float_reader(:lightFlickerRadius)
    vector4_reader(:lightColor)
    float_reader(:lightRadius)
    vector4_reader(:lightWarpColor)
    float_reader(:lightWarpRadius)
    object_reader(:shape0)
    object_reader(:shape1)
    uint_reader(:shapeAtlasCount)
    uint_reader(:shapeAtlasHeight)
    string_reader(:shapeAtlasResPath)
    uint_reader(:shapeAtlasWidth)
    float_reader(:symHaloScale)
    vector4_reader(:trailColor)
    vector4_reader(:trailSize)
    vector4_reader(:warpGlowColor)
    vector4_reader(:warpHalpColor)
    object_reader(:warpShape0)
    object_reader(:warpShape1)
  end
  
  class EveSOFDataBoosterShape < Black::Object
    vector4_reader(:color)
    float_reader(:noiseFunction)
    float_reader(:noiseSpeed)
    vector4_reader(:noiseAmplitureStart)
    vector4_reader(:noiseAmplitureEnd)
    vector4_reader(:noiseFrequency)
  end
  
  class EveSOFDataFaction < Black::Object
    object_reader(:areaTypes)
    object_reader(:colorSet)
    array_reader(:children)
    array_reader(:decals)
    object_reader(:defaultPattern)
    string_reader(:defaultPatternLayer1MaterialName)
    string_reader(:description)
    uint_reader(:materialUsageMtl1)
    uint_reader(:materialUsageMtl2)
    uint_reader(:materialUsageMtl3)
    uint_reader(:materialUsageMtl4)
    string_reader(:name)
    array_reader(:planeSets)
    string_reader(:resPathInsert)
    array_reader(:spotlightSets)
    object_reader(:visibilityGroupSet)
  end
  
  class EveSOFDataFactionChild < Black::Object
    uint_reader(:groupIndex)
    string_reader(:name)
    boolean_reader(:isVisible)
  end
  
  class EveSOFDataFactionColorSet < Black::Object
    vector4_reader(:Black)
    vector4_reader(:Blue)
    vector4_reader(:Booster)
    vector4_reader(:Cyan)
    vector4_reader(:Darkhull)
    vector4_reader(:Fire)
    vector4_reader(:Glass)
    vector4_reader(:Green)
    vector4_reader(:Hull)
    vector4_reader(:Killmark)
    vector4_reader(:Orange)
    vector4_reader(:Primary)
    vector4_reader(:Reactor)
    vector4_reader(:Red)
    vector4_reader(:Secondary)
    vector4_reader(:Tertiary)
    vector4_reader(:White)
    vector4_reader(:Yellow)
  end
  
  class EveSOFDataFactionDecal < Black::Object
    uint_reader(:groupIndex)
    string_reader(:name)
    array_reader(:parameters)
    string_reader(:shader)
    array_reader(:textures)
    boolean_reader(:isVisible)
  end
  
  class EveSOFDataFactionPlaneSet < Black::Object
    vector4_reader(:color)
    uint_reader(:groupIndex)
    string_reader(:name)
  end
  
  class EveSOFDataFactionVisibilityGroupSet < Black::Object
    array_reader(:visibilityGroups)
  end
  
  class EveSOFDataGeneric < Black::Object
    string_reader(:areaShaderLocation)
    array_reader(:areaShaders)
    object_reader(:bannerShader, id: nil)
    string_reader(:decalShaderLocation)
    array_reader(:decalShaders)
    object_reader(:damage)
    object_reader(:genericWreckMaterial)
    object_reader(:hullDamage)
    array_reader(:materialPrefixes)
    array_reader(:patternMaterialPrefixes)
    string_reader(:resPathDefaultAlliance)
    string_reader(:resPathDefaultCeo)
    string_reader(:resPathDefaultCorp)
    string_reader(:shaderPrefixAnimated)
    object_reader(:swarm)
    array_reader(:variants)
  end

  class EveSOFDataGenericDamage < Black::Object
    float_reader(:armorParticleAngle)
    vector4_reader(:armorParticleColor0)
    vector4_reader(:armorParticleColor1)
    vector4_reader(:armorParticleColor2)
    vector4_reader(:armorParticleColor3)
    float_reader(:armorParticleDrag)
    vector2_reader(:armorParticleMinMaxLifeTime)
    vector2_reader(:armorParticleMinMaxSpeed)
    float_reader(:armorParticleRate)
    vector4_reader(:armorParticleSizes)
    float_reader(:armorParticleTurbulenceAmplitude)
    float_reader(:armorParticleTurbulenceFrequency)
    float_reader(:armorParticleVelocityStretchRotation)
    uint_reader(:armorParticleTextureIndex)
    string_reader(:armorShader)
    float_reader(:flickerPerlinAlpha)
    float_reader(:flickerPerlinBeta)
    float_reader(:flickerPerlinSpeed)
    uint_reader(:flickerPerlinN)
    string_reader(:shieldGeometryResFilePath)
    string_reader(:shieldShaderEllipsoid)
    string_reader(:shieldShaderHull)
  end

  class EveSOFDataGenericDecalShader < Black::Object
    array_reader(:defaultParameters)
    array_reader(:defaultTextures)
    array_reader(:parameters)
    array_reader(:parentTextures)
    string_reader(:shader)
  end
  
  class EveSOFDataGenericHullDamage < Black::Object
    float_reader(:hullParticleAngle)
    vector4_reader(:hullParticleColor0)
    vector4_reader(:hullParticleColor1)
    vector4_reader(:hullParticleColor2)
    float_reader(:hullParticleColorMidpoint)
    float_reader(:hullParticleDrag)
    vector2_reader(:hullParticleMinMaxLifeTime)
    vector2_reader(:hullParticleMinMaxSpeed)
    float_reader(:hullParticleRate)
    vector4_reader(:hullParticleSizes)
    float_reader(:hullParticleTurbulenceAmplitude)
    float_reader(:hullParticleTurbulenceFrequency)
    uint_reader(:hullParticleTextureIndex)
  end

  class EveSOFDataGenericShader < Black::Object
    array_reader(:defaultParameters)
    array_reader(:defaultTextures)
    boolean_reader(:doGenerateDepthArea)
    array_reader(:parameters)
    string_reader(:shader)
    string_reader(:transparencyTextureName)
  end

  class EveSOFDataGenericString < Black::Object
    string_reader(:str)
  end
  
  class EveSOFDataGenericSwarm < Black::Object
    float_reader(:formationDistance)
    float_reader(:maxDistance0)
    float_reader(:maxDeceleration)
    float_reader(:separationDistance)
    float_reader(:wanderDistance)
    float_reader(:wanderFluctuation)
    float_reader(:wanderRadius)
    float_reader(:weightAlign)
    float_reader(:weightAnchor)
    float_reader(:weightCohesion)
    float_reader(:weightDeceleration)
    float_reader(:weightFormation)
    float_reader(:weightSeparation)
  end
  
  class EveSOFDataGenericVariant < Black::Object
    object_reader(:hullArea)
    boolean_reader(:isTransparent)
    string_reader(:name)
  end
  
  class EveSOFDataHull < Black::Object
    array_reader(:additiveAreas)
    array_reader(:animations)
    vector3_reader(:audioPosition)
    array_reader(:banners)
    object_reader(:booster)
    vector4_reader(:boundingSphere)
    uint_reader(:buildClass)
    boolean_reader(:castShadow)
    string_reader(:category)
    array_reader(:children)
    array_reader(:controllers)
    array_reader(:decalAreas)
    object_reader(:defaultPattern)
    string_reader(:description)
    array_reader(:distortionAreas)
    boolean_reader(:enableDynamicBoundingSphere)
    string_reader(:geometryResFilePath)
    array_reader(:hazeSets)
    array_reader(:hullDecals)
    uint_reader(:impactEffectType)
    array_reader(:instancedMeshes)
    boolean_reader(:isSkinned)
    array_reader(:locatorSets)
    array_reader(:locatorTurrets)
    string_reader(:name)
    array_reader(:opaqueAreas)
    array_reader(:planeSets)
    string_reader(:modelRotationCurvePath)
    vector3_reader(:shapeEllipsoidCenter)
    vector3_reader(:shapeEllipsoidRadius)
    array_reader(:spotlightSets)
    array_reader(:spriteLineSets)
    array_reader(:spriteSets)
    array_reader(:transparentAreas)
  end
  
  class EveSOFDataHullAnimation < Black::Object
    float_reader(:endRate)
    float_reader(:endRotationTime)
    vector4_reader(:endRotationValue)
    uint_reader(:id)
    string_reader(:name)
    float_reader(:startRate)
    float_reader(:startRotationTime)
    vector4_reader(:startRotationValue)
  end
  
  class EveSOFDataHullArea < Black::Object
    uint_reader(:areaType)
    uint_reader(:blockedMaterials)
    uint_reader(:count)
    uint_reader(:index)
    string_reader(:name)
    array_reader(:parameters)
    string_reader(:shader)
    array_reader(:textures)
  end
  
  class EveSOFDataHullBanner < Black::Object
    float_reader(:angleX)
    float_reader(:angleY)
    float_reader(:angleZ)
    uint_reader(:boneIndex)
    string_reader(:name)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    uint_reader(:usage)
  end

  class EveSOFDataHullBooster < Black::Object
    boolean_reader(:alwaysOn)
    boolean_reader(:hasTrails)
    array_reader(:items)
  end
  
  class EveSOFDataHullBoosterItem < Black::Object
    uint_reader(:atlasIndex0)
    uint_reader(:atlasIndex1)
    vector4_reader(:functionality)
    boolean_reader(:hasTrail)
    matrix_reader(:transform)
  end
  
  class EveSOFDataHullChild < Black::Object
    uint_reader(:groupIndex)
    uint_reader(:lowestLodVisible)
    string_reader(:name)
    string_reader(:redFilePath)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector3_reader(:translation)
  end

  class EveSOFDataHullController < Black::Object
    string_reader(:path)
  end

  class EveSOFDataHullDecal < Black::Object
    uint_reader(:boneIndex)
    uint_reader(:glowColorType)
    uint_reader(:groupIndex)
    string_reader(:name)
    uint_reader(:meshIndex)
    array_reader(:parameters)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    string_reader(:shader)
    array_reader(:textures)
    uint_reader(:usage)
    
    black_reader(:indexBuffer) do |reader|
      index_count = reader.read_u32
      index_size = reader.read_u16

      raise ArgumentError, "#{index_size}" unless index_size == 4

      index_count.times.map { reader.read_u32 }
    end
  end
  
  class EveSOFDataHullHazeSet < Black::Object
    array_reader(:items)
    string_reader(:name)
  end
  
  class EveSOFDataHullHazeSetItem < Black::Object
    boolean_reader(:boosterGainInfluence)
    uint_reader(:colorType)
    float_reader(:hazeBrightness)
    float_reader(:hazeFalloff)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    float_reader(:sourceBrightness)
    float_reader(:sourceSize)
  end
  
  class EveSOFDataHullLocator < Black::Object
    string_reader(:name)
    matrix_reader(:transform)
  end
  
  class EveSOFDataHullLocatorSet < Black::Object
    string_reader(:name)
    array_reader(:locators)
  end
  
  class EveSOFDataHullPlaneSet < Black::Object
    uint_reader(:atlasSize)
    array_reader(:items)
    string_reader(:layer1MapResPath)
    string_reader(:layer2MapResPath)
    string_reader(:maskMapResPath)
    string_reader(:name)
    boolean_reader(:skinned)
    uint_reader(:usage)
  end
  
  class EveSOFDataHullPlaneSetItem < Black::Object
    uint_reader(:boneIndex)
    vector4_reader(:color)
    uint_reader(:groupIndex)
    vector4_reader(:layer1Scroll)
    vector4_reader(:layer1Transform)
    vector4_reader(:layer2Scroll)
    vector4_reader(:layer2Transform)
    uint_reader(:maskMapAtlasIndex)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
  end

  class EveSOFDataHullSpotlightSet < Black::Object
    string_reader(:coneTextureResPath)
    string_reader(:glowTextureResPath)
    array_reader(:items)
    string_reader(:name)
    boolean_reader(:skinned)
    float_reader(:zOffset)
  end
  
  class EveSOFDataHullSpotlightSetItem < Black::Object
    uint_reader(:boneIndex)
    boolean_reader(:boosterGainInfluence)
    float_reader(:coneIntensity)
    float_reader(:flareIntensity)
    uint_reader(:groupIndex)
    vector3_reader(:spriteScale)
    float_reader(:spriteIntensity)
    matrix_reader(:transform)
  end

  class EveSOFDataHullSpriteLineSet < Black::Object
    array_reader(:items)
    string_reader(:name)
    boolean_reader(:skinned)
    string_reader(:visibilityGroup)
  end

  class EveSOFDataHullSpriteLineSetItem < Black::Object
    float_reader(:blinkRate)
    float_reader(:blinkPhase)
    float_reader(:blinkPhaseShift)
    uint_reader(:boneIndex)
    uint_reader(:colorType)
    float_reader(:falloff)
    float_reader(:intensity)
    boolean_reader(:isCircle)
    float_reader(:maxScale)
    float_reader(:minScale)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    float_reader(:spacing)
  end

  class EveSOFDataHullSpriteSet < Black::Object
    string_reader(:name)
    array_reader(:items)
    boolean_reader(:skinned)
    string_reader(:visibilityGroup)
  end
  
  class EveSOFDataHullSpriteSetItem < Black::Object
    float_reader(:blinkRate)
    float_reader(:blinkPhase)
    uint_reader(:boneIndex)
    uint_reader(:colorType)
    float_reader(:falloff)
    float_reader(:intensity)
    float_reader(:maxScale)
    float_reader(:minScale)
    vector3_reader(:position)
  end
  
  class EveSOFDataInstancedMesh < Black::Object
    string_reader(:geometryResPath)
    uint_reader(:lowestLodVisible)
    string_reader(:name)
    string_reader(:shader)
    array_reader(:textures)
    
    black_reader(:instances) do |reader|
      instance_count = reader.read_u32
      instance_length = reader.read_u16

      instance_count.times.map { reader.read(instance_length) }
    end
  end
  
  class EveSOFDataMaterial < Black::Object
    string_reader(:name)
    array_reader(:parameters)
  end
  
  class EveSOFDataParameter < Black::Object
    string_reader(:name)
    vector4_reader(:value)
  end
  
  class EveSOFDataPattern < Black::Object
    string_reader(:name)
    object_reader(:layer1)
    object_reader(:layer2)
    array_reader(:projections)
  end
  
  class EveSOFDataPatternLayer < Black::Object
    boolean_reader(:isTargetMtl1)
    boolean_reader(:isTargetMtl2)
    boolean_reader(:isTargetMtl3)
    boolean_reader(:isTargetMtl4)
    uint_reader(:materialSource)
    uint_reader(:projectionTypeU)
    uint_reader(:projectionTypeV)
    string_reader(:textureName)
    string_reader(:textureResFilePath)
  end
  
  class EveSOFDataPatternPerHull < Black::Object
    string_reader(:name)
    object_reader(:transformLayer1)
    object_reader(:transformLayer2)
  end
  
  class EveSOFDataPatternTransform < Black::Object
    boolean_reader(:isMirrored)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
  end
  
  class EveSOFDataRace < Black::Object
    object_reader(:booster)
    object_reader(:damage)
    object_reader(:hullDamage)
    string_reader(:name)
  end
  
  class EveSOFDataRaceDamage < Black::Object
    array_reader(:armorImpactParameters)
    array_reader(:armorImpactTextures)
    array_reader(:shieldImpactParameters)
    array_reader(:shieldImpactTextures)
  end
  
  class EveSOFDataFactionSpotlightSet < Black::Object
    vector4_reader(:coneColor)
    vector4_reader(:flareColor)
    uint_reader(:groupIndex)
    string_reader(:name)
    vector4_reader(:spriteColor)
  end
  
  class EveSOFDataTexture < Black::Object
    string_reader(:name)
    string_reader(:resFilePath)
  end
  
  class EveSOFDataTransform < Black::Object
    uint_reader(:boneIndex)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
  end
end
