module Black
  class EveBoosterSet2 < Black::Object
    boolean_reader(:alwaysOn)
    float_reader(:alwaysOnIntensity)
    object_reader(:effect)
    object_reader(:glows)
    vector4_reader(:glowColor)
    float_reader(:glowScale)
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
    float_reader(:symHaloScale)
    object_reader(:trails)
    vector4_reader(:warpGlowColor)
    vector4_reader(:warpHaloColor)
  end

  class EveCamera < Black::Object
    float_reader(:fieldOfView)
    float_reader(:friction)
    float_reader(:frontClip)
    boolean_reader(:idleMove)
    float_reader(:idleScale)
    float_reader(:idleSpeed)
    vector3_reader(:intr)
    float_reader(:pitch)
    vector3_reader(:pos)
    float_reader(:maxSpeed)
    float_reader(:noiseScale)
    object_reader(:noiseScaleCurve)
    vector4_reader(:rotationAroundParent)
    float_reader(:translationFromParent)
    float_reader(:yaw)
    object_reader(:zoomCurve)
  end

  class EveChildCloud < Black::Object
    float_reader(:cellScreenSize)
    float_reader(:sortingModifier)
    object_reader(:effect)
    string_reader(:name)
    uint_reader(:preTesselationLevel)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector3_reader(:translation)
  end

  class EveChildBulletStorm < Black::Object
    object_reader(:effect)
    uint_reader(:multiplier)
    float_reader(:range)
    float_reader(:speed)
    string_reader(:sourceLocatorSet)
  end

  class EveChildContainer < Black::Object
    uint_reader(:boneIndex)
    array_reader(:controllers)
    boolean_reader(:display)
    matrix_reader(:localTransform)
    string_reader(:name)
    array_reader(:curveSets)
    boolean_reader(:hideOnLowQuality)
    array_reader(:lights)
    array_reader(:observers)
    array_reader(:objects)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    boolean_reader(:staticTransform)
    array_reader(:transformModifiers)
    vector3_reader(:translation)
  end

  class EveChildExplosion < Black::Object
    float_reader(:globalDuration)
    object_reader(:globalExplosion)
    float_reader(:globalExplosionDelay)
    array_reader(:globalExplosions)
    vector3_reader(:globalScaling)
    float_reader(:localDuration)
    object_reader(:localExplosion)
    array_reader(:localExplosions)
    float_reader(:localExplosionInterval)
    float_reader(:localExplosionIntervalFactor)
    object_reader(:localExplosionShared)
    matrix_reader(:localTransform)
    string_reader(:name)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
  end

  class EveChildLink < Black::Object
    array_reader(:linkStrengthBindings)
    array_reader(:linkStrengthCurves)
    object_reader(:mesh)
    string_reader(:name)
    vector4_reader(:rotation)
  end

  class EveChildMesh < Black::Object
    boolean_reader(:display)
    matrix_reader(:localTransform)
    uint_reader(:lowestLodVisible)
    object_reader(:mesh)
    float_reader(:minScreenSize)
    string_reader(:name)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    float_reader(:sortValueOffset)
    boolean_reader(:staticTransform)
    array_reader(:transformModifiers)
    vector3_reader(:translation)
    boolean_reader(:useSpaceObjectData)
    boolean_reader(:useSRT)
  end

  class EveChildParticleSphere < Black::Object
    array_reader(:generators)
    float_reader(:maxSpeed)
    object_reader(:mesh)
    float_reader(:movementScale)
    string_reader(:name)
    object_reader(:particleSystem)
    float_reader(:positionShiftDecreaseSpeed)
    float_reader(:positionShiftIncreaseSpeed)
    float_reader(:positionShiftMax)
    float_reader(:positionShiftMin)
    float_reader(:radius)
    boolean_reader(:useSpaceObjectData)
  end

  class EveChildParticleSystem < Black::Object
    boolean_reader(:display)
    matrix_reader(:localTransform)
    float_reader(:lodSphereRadius)
    object_reader(:mesh)
    float_reader(:minScreenSize)
    string_reader(:name)
    array_reader(:particleEmitters)
    array_reader(:particleSystems)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector3_reader(:translation)
    boolean_reader(:useDynamicLod)
  end

  class EveChildModifierAttachToBone < Black::Object
    uint_reader(:boneIndex)
  end

  class EveChildModifierBillboard2D < Black::Object
  end

  class EveChildModifierBillboard3D < Black::Object
  end

  class EveChildModifierCameraOrientedRotationConstrained < Black::Object
  end

  class EveChildModifierSRT < Black::Object
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector3_reader(:translation)
  end
  
  class EveChildModifierTranslateWithCamera < Black::Object
  end

  class EveChildQuad < Black::Object
    float_reader(:brightness)
    vector4_reader(:color)
    object_reader(:effect)
    matrix_reader(:localTransform)
    float_reader(:minScreenSize)
    string_reader(:name)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector3_reader(:translation)
  end
  
  class EveConnector < Black::Object
    vector4_reader(:animationColor)
    float_reader(:animationScale)
    float_reader(:animationSpeed)
    vector4_reader(:color)
    object_reader(:destObject)
    vector3_reader(:destPosition)
    boolean_reader(:isAnimated)
    float_reader(:lineWidth)
    object_reader(:sourceObject)
    vector3_reader(:sourcePosition)
    uint_reader(:type)
  end

  class EveCurveLineSet < Black::Object
    object_reader(:lineEffect)
    object_reader(:pickEffect)
  end

  class EveCustomMask < Black::Object
    byte_reader(:materialIndex)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector4_reader(:targetMaterials)
  end

  class EveEffectRoot2 < Black::Object
    vector3_reader(:boundingSphereCenter)
    float_reader(:boundingSphereRadius)
    array_reader(:curveSets)
    float_reader(:duration)
    boolean_reader(:dynamicLOD)
    array_reader(:effectChildren)
    array_reader(:lights)
    string_reader(:name)
    array_reader(:observers)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    vector4_reader(:secondaryLightingEmissiveColor)
    float_reader(:secondaryLightingSphereRadius)
    vector3_reader(:translation)
  end
  
  class EveLensflare < Black::Object
    array_reader(:backgroundOccluders)
    array_reader(:bindings)
    array_reader(:distanceToCenterCurves)
    array_reader(:distanceToEdgeCurves)
    object_reader(:mesh)
    string_reader(:name)
    array_reader(:occluders)
    vector3_reader(:position)
    array_reader(:radialAngleCurves)
    array_reader(:xDistanceToCenter)
    array_reader(:yDistanceToCenter)
    array_reader(:zDistanceToCenter)
  end
  
  class EveLineContainer < Black::Object
    object_reader(:lineSet)
  end
  
  class EveLocalPositionCurve < Black::Object
    vector3_reader(:value)
  end

  class EveLocatorSets < Black::Object
    string_reader(:name)

    black_reader(:locators) do |reader|
      locator_count = reader.read_u32
      locator_length = reader.read_u16

      raise ArgumentError unless locator_length == 0x20

      locator_count.times.map do
        {
          "position" => reader.read_f32x4,
          "direction" => reader.read_f32x4
        }
      end
    end
  end

  class EveLocator2 < Black::Object
    string_reader(:name)
    matrix_reader(:transform)
  end

  class EveMeshOverlayEffect < Black::Object
    array_reader(:additiveEffects)
    object_reader(:curveSet)
    array_reader(:distortionEffects)
    string_reader(:name)
    array_reader(:opaqueEffects)
    array_reader(:transparentEffects)
  end

  class EveMissile < Black::Object
    vector3_reader(:boundingSphereCenter)
    float_reader(:boundingSphereRadius)
    object_reader(:modelTranslationCurve)
    string_reader(:name)
    array_reader(:warheads)
  end

  class EveMissileWarhead < Black::Object
    float_reader(:acceleration)
    float_reader(:durationEjectPhase)
    float_reader(:impactDuration)
    float_reader(:impactSize)
    float_reader(:maxExplosionDistance)
    object_reader(:mesh)
    array_reader(:particleEmitters)
    float_reader(:pathOffsetNoiseScale)
    float_reader(:pathOffsetNoiseSpeed)
    object_reader(:spriteSet)
    float_reader(:startEjectVelocity)
    float_reader(:warheadLength)
    float_reader(:warheadRadius)
  end

  class EveMobile < Black::Object
    array_reader(:attachments)
    vector3_reader(:boundingSphereCenter)
    float_reader(:boundingSphereRadius)
    array_reader(:children)
    array_reader(:controllers)
    array_reader(:curveSets)
    array_reader(:locatorSets)
    string_reader(:name)
    object_reader(:meshLod)
    array_reader(:observers)
    object_reader(:shadowEffect)
  end

  class EveOccluder < Black::Object
    string_reader(:name)
    array_reader(:sprites)
  end

  class EveParticleDirectForce < Black::Object
    vector3_reader(:force)
  end

  class EveParticleDragForce < Black::Object
    float_reader(:drag)
  end

  class EvePlaneSet < Black::Object
    object_reader(:effect)
    boolean_reader(:hideOnLowQuality)
    string_reader(:name)
    byte_reader(:pickBufferID)
    array_reader(:planes)
  end

  class EvePlaneSetItem < Black::Object
    vector4_reader(:color)
    vector4_reader(:layer1Scroll)
    vector4_reader(:layer1Transform)
    vector4_reader(:layer2Scroll)
    vector4_reader(:layer2Transform)
    uint_reader(:maskAtlasID)
    string_reader(:name)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
  end

  class EveRootTransform < Black::Object
    float_reader(:boundingSphereRadius)
    array_reader(:children)
    array_reader(:curveSets)
    boolean_reader(:display)
    object_reader(:mesh)
    uint_reader(:modifier)
    string_reader(:name)
    array_reader(:observers)
    vector3_reader(:position)
    vector4_reader(:rotation)
    object_reader(:rotationCurve)
    vector3_reader(:scaling)
    float_reader(:sortValueMultiplier)
    vector3_reader(:translation)
    object_reader(:translationCurve)
    boolean_reader(:useDistanceBasedScale)
  end

  class EveShip2 < Black::Object
    array_reader(:attachments)
    object_reader(:boosters)
    vector3_reader(:boundingSphereCenter)
    float_reader(:boundingSphereRadius)
    array_reader(:children)
    array_reader(:customMasks)
    array_reader(:decals)
    string_reader(:dna)
    array_reader(:locatorSets)
    array_reader(:locators)
    object_reader(:mesh)
    string_reader(:name)
    object_reader(:meshLod)
    object_reader(:rotationCurve)
    object_reader(:shadowEffect)
    vector3_reader(:shapeEllipsoidCenter)
    vector3_reader(:shapeEllipsoidRadius)
    object_reader(:translationCurve)
  end

  class EveStation2 < Black::Object
    array_reader(:attachments)
    vector3_reader(:boundingSphereCenter)
    float_reader(:boundingSphereRadius)
    array_reader(:children)
    array_reader(:curveSets)
    array_reader(:decals)
    array_reader(:effectChildren)
    array_reader(:lights)
    array_reader(:locatorSets)
    array_reader(:locators)
    string_reader(:name)
    object_reader(:mesh)
    object_reader(:meshLod)
    float_reader(:modelScale)
    array_reader(:observers)
    object_reader(:rotationCurve)
    object_reader(:modelRotationCurve)
    object_reader(:shadowEffect)
    object_reader(:translationCurve)
  end

  class EveSpaceObjectDecal < Black::Object
    object_reader(:decalEffect)
    string_reader(:name)
    vector3_reader(:position)
    vector4_reader(:rotation)
    vector3_reader(:scaling)

    black_reader(:indexBuffer) do |reader|
      index_count = reader.read_u32
      index_size = reader.read_u16

      raise ArgumentError, "#{index_size}" unless index_size == 4

      index_count.times.map { reader.read_u32 }
    end
  end

  class EveSpaceScene < Black::Object
    vector4_reader(:ambientColor)
    object_reader(:backgroundEffect)
    array_reader(:backgroundObjects)
    boolean_reader(:backgroundRenderingEnabled)
    array_reader(:curveSets)
    boolean_reader(:enableShadows)
    string_reader(:envMapResPath)
    string_reader(:envMap1ResPath)
    string_reader(:envMap2ResPath)
    vector4_reader(:envMapRotation)
    array_reader(:externalParameters)
    vector4_reader(:fogColor)
    float_reader(:fogStart)
    float_reader(:fogEnd)
    float_reader(:fogMax)
    float_reader(:nebulaIntensity)
    array_reader(:objects)
    string_reader(:postProcessPath)
    boolean_reader(:selfShadowOnly)
    object_reader(:starfield)
    float_reader(:shadowFadeThreshold)
    float_reader(:shadowThreshold)
    object_reader(:shLightingManager)
    vector4_reader(:sunDiffuseColor)
    vector4_reader(:sunDiffuseColorWithDynamicLights)
    vector3_reader(:sunDirection)
    boolean_reader(:useSunDiffuseColorWithDynamicLights)
  end

  class EveSpherePin < Black::Object
    vector3_reader(:centerNormal)
    vector4_reader(:color)
    array_reader(:curveSets)
    boolean_reader(:enablePicking)
    string_reader(:geometryResPath)
    string_reader(:name)
    vector4_reader(:pinColor)
    object_reader(:pinEffect)
    float_reader(:pinMaxRadius)
    float_reader(:pinRadius)
    float_reader(:pinRotation)
    float_reader(:sortValueMultiplier)
  end

  class EveSpotlightSet < Black::Object
    object_reader(:coneEffect)
    object_reader(:glowEffect)
    float_reader(:intensity)
    string_reader(:name)
    array_reader(:spotlightItems)
  end

  class EveSpotlightSetItem < Black::Object
    vector4_reader(:coneColor)
    vector4_reader(:flareColor)
    string_reader(:name)
    vector4_reader(:spriteColor)
    vector3_reader(:spriteScale)
    matrix_reader(:transform)
  end

  class EveSpriteSet < Black::Object
    object_reader(:effect)
    string_reader(:name)
    float_reader(:intensity)
    boolean_reader(:skinned)
    array_reader(:sprites)
  end

  class EveSpriteSetItem < Black::Object
    float_reader(:blinkPhase)
    float_reader(:blinkRate)
    uint_reader(:boneIndex)
    vector4_reader(:color)
    float_reader(:falloff)
    float_reader(:maxScale)
    float_reader(:minScale)
    string_reader(:name)
    vector3_reader(:position)
    vector4_reader(:warpColor)
  end

  class EveStarfield < Black::Object
    object_reader(:effect)
    float_reader(:maxDist)
    float_reader(:maxFlashRate)
    float_reader(:minDist)
    float_reader(:minFlashIntensity)
    float_reader(:minFlashRate)
    uint_reader(:numStars)
    uint_reader(:seed)
  end

  class EveStretch < Black::Object
    array_reader(:curveSets)
    object_reader(:dest)
    object_reader(:destObject)
    object_reader(:length)
    object_reader(:moveCompletion)
    object_reader(:moveObject)
    string_reader(:name)
    object_reader(:progressCurve)
    object_reader(:source)
    array_reader(:sourceLights)
    object_reader(:sourceObject)
    object_reader(:stretchObject)
    boolean_reader(:useCurveLod)
  end

  class EveStretch2 < Black::Object
    object_reader(:destinationEmitter)
    object_reader(:destinationLight)
    object_reader(:effect)
    object_reader(:loop)
    string_reader(:name)
    object_reader(:sourceEmitter)
    object_reader(:sourceLight)
    uint_reader(:quadCount)
  end
  
  class EveTacticalOverlay < Black::Object
    object_reader(:anchorEffect)
    float_reader(:arcSegmentMultiplier)
    object_reader(:connectorEffect)
    float_reader(:segmentsLow)
    float_reader(:segmentsMedium)
    float_reader(:segmentsHigh)
    float_reader(:targetMaxSegments)
    object_reader(:velocityEffect)
  end

  class EveTrailsSet < Black::Object
    object_reader(:effect)
    string_reader(:geometryResPath)
  end

  class EveTransform < Black::Object
    array_reader(:children)
    array_reader(:curveSets)
    boolean_reader(:display)
    float_reader(:distanceBasedScaleArg1)
    float_reader(:distanceBasedScaleArg2)
    boolean_reader(:hideOnLowQuality)
    string_reader(:name)
    object_reader(:mesh)
    object_reader(:meshLod)
    uint_reader(:modifier)
    array_reader(:observers)
    vector3_reader(:overrideBoundsMax)
    vector3_reader(:overrideBoundsMin)
    array_reader(:particleEmitters)
    array_reader(:particleSystems)
    vector4_reader(:rotation)
    vector3_reader(:scaling)
    float_reader(:sortValueMultiplier)
    vector3_reader(:translation)
    boolean_reader(:update)
    boolean_reader(:useDistanceBasedScale)
    boolean_reader(:useLodLevel)
    float_reader(:visibilityThreshold)
  end
  
  class EveTurretFiringFX < Black::Object
    string_reader(:boneName)
    object_reader(:destinationObserver)
    float_reader(:firingDelay1)
    float_reader(:firingDelay2)
    float_reader(:firingDelay3)
    float_reader(:firingDelay4)
    float_reader(:firingDurationOverride)
    float_reader(:firingPeakTime)
    boolean_reader(:isLoopFiring)
    float_reader(:maxRadius)
    float_reader(:maxScale)
    float_reader(:minRadius)
    float_reader(:minScale)
    string_reader(:name)
    boolean_reader(:scaleEffectTarget)
    object_reader(:sourceObserver)
    object_reader(:startCurveSet)
    object_reader(:stopCurveSet)
    array_reader(:stretch)
    boolean_reader(:useMuzzleTransform)
  end
  
  class EveTurretSet < Black::Object
    string_reader(:name)
    float_reader(:bottomClipHeight)
    vector4_reader(:boundingSphere)
    boolean_reader(:chooseRandomLocator)
    uint_reader(:cyclingFireGroupCount)
    string_reader(:firingEffectResPath)
    string_reader(:geometryResPath)
    float_reader(:impactSize)
    boolean_reader(:laserMissBehaviour)
    string_reader(:locatorName)
    uint_reader(:maxCyclingFirePos)
    boolean_reader(:projectileMissBehaviour)
    float_reader(:sysBoneHeight)
    float_reader(:sysBonePitchMax)
    float_reader(:sysBonePitchMin)
    float_reader(:sysBonePitchFactor)
    float_reader(:sysBonePitch01Factor)
    float_reader(:sysBonePitch02Factor)
    float_reader(:sysBonePitchOffset)
    object_reader(:turretEffect)
    boolean_reader(:updatePitchPose)
    boolean_reader(:useDynamicBounds)
    boolean_reader(:useRandomFiringDelay)
  end
  
  class EveUiObject < Black::Object
    float_reader(:boundingSphereRadius)
    string_reader(:name)
    object_reader(:mesh)
    float_reader(:modelScale)
  end
end
