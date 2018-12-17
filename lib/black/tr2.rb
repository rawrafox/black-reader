module Black
  class Tr2Action < Black::Object
  end
  
  class Tr2ActionAnimateCurveSet < Tr2Action
    object_reader(:curveSet)
    string_reader(:value)
  end
  
  class Tr2ActionAnimateValue < Tr2Action
    string_reader(:attribute)
    object_reader(:curve)
    string_reader(:path)
    string_reader(:value)
  end
  
  class Tr2ActionChildEffect < Tr2Action
    string_reader(:childName)
    string_reader(:path)
    boolean_reader(:removeOnStop)
  end
  
  class Tr2ActionOverlay < Tr2Action
    string_reader(:path)
  end
  
  class Tr2ActionPlayCurveSet < Tr2Action
    string_reader(:curveSetName)
    string_reader(:rangeName)
    boolean_reader(:syncToRange)
  end
  
  class Tr2ActionPlayMeshAnimation < Tr2Action
    string_reader(:animation)
    uint_reader(:loops)
    string_reader(:mask)
  end
  
  class Tr2ActionResetClipSphereCenter < Tr2Action
  end
  
  class Tr2ActionSetValue < Tr2Action
    string_reader(:attribute)
    string_reader(:path)
    string_reader(:value)
  end
  
  class Tr2Adapter < Black::Object
    object_reader(:curve)
  end

  class Tr2TranslationAdapter < Tr2Adapter
    vector3_reader(:value)
  end

  class Tr2RotationAdapter < Tr2Adapter
    vector4_reader(:value)
  end
  
  class Tr2AttributeGenerator < Black::Object
    string_reader(:customName)
  end

  class Tr2RandomIntegerAttributeGenerator < Tr2AttributeGenerator
    vector4_reader(:minRange)
    vector4_reader(:maxRange)
  end

  class Tr2RandomUniformAttributeGenerator < Tr2AttributeGenerator
    vector4_reader(:minRange)
    vector4_reader(:maxRange)

    black_reader(:elementType) do |reader|
      Tr2ParticleElementDeclaration::TYPE.fetch(reader.read_u32)
    end
  end

  class Tr2SphereShapeAttributeGenerator < Tr2AttributeGenerator
    float_reader(:distributionExponent)
    float_reader(:maxPhi)
    float_reader(:maxRadius)
    float_reader(:maxSpeed)
    float_reader(:maxTheta)
    float_reader(:minPhi)
    float_reader(:minRadius)
    float_reader(:minSpeed)
    float_reader(:minTheta)
    float_reader(:parentVelocityFactor)
    vector3_reader(:position)
    vector4_reader(:rotation)
  end

  class Tr2Constraint < Black::Object
  end

  class Tr2PlaneConstraint < Tr2Constraint
    float_reader(:reflectionNoise)
    array_reader(:generators)
  end

  class Tr2Controller < Black::Object
    boolean_reader(:isShared)
    array_reader(:stateMachines)
    string_reader(:name)
    array_reader(:variables)
  end

  class Tr2ControllerReference < Black::Object
    string_reader(:path)
  end

  class Tr2ControllerVariable < Black::Object
    string_reader(:name)
    uint_reader(:variableType)
  end

  class Tr2ControllerFloatVariable < Tr2ControllerVariable
    float_reader(:defaultValue)
  end

  class Tr2Curve < Black::Object
    INTERPOLATION = {
      0 => "CONSTANT",
      1 => "LINEAR",
      2 => "HERMITE"
    }

    EXTRAPOLATION = {
      0 => "CONSTANT",
      3 => "CYCLE"
    }

    string_reader(:name)
  end

  class Tr2BoneMatrixCurve < Tr2Curve
  end

  class Tr2CurveColor < Tr2Curve
    object_reader(:r, id: nil)
    object_reader(:g, id: nil)
    object_reader(:b, id: nil)
    object_reader(:a, id: nil)
  end

  class Tr2CurveConstant < Tr2Curve
    vector4_reader(:value)
  end

  class Tr2CurveEulerRotation < Tr2Curve
    object_reader(:pitch, id: nil)
    object_reader(:roll, id: nil)
    object_reader(:yaw, id: nil)
  end

  class Tr2CurveScalar < Tr2Curve
    float_reader(:timeOffset)
    float_reader(:timeScale)
    
    black_reader(:extrapolationAfter) do |reader|
      reader.read_u32
    end

    black_reader(:extrapolationBefore) do |reader|
      reader.read_u32
    end

    black_reader(:keys) do |reader|
      key_count = reader.read_u32
      key_length = reader.read_u16

      key_count.times.map do |i|
        key_reader = reader.read_binary(key_length)

        raise ArgumentError unless key_length == 0x0014

        result = Hash.new
        result["time"] = key_reader.read_f32
        result["value"] = key_reader.read_f32
        result["startTangent"] = key_reader.read_f32
        result["endTangent"] = key_reader.read_f32
        result["index"] = key_reader.read_u16
        result["interpolation"] = key_reader.read_u8 # TODO: Figure this out
        result["extrapolation"] = key_reader.read_u8 # TODO: Figure this out

        result
      end
    end
  end

  class Tr2CurveVector3 < Tr2Curve
    object_reader(:x, id: nil)
    object_reader(:y, id: nil)
    object_reader(:z, id: nil)
  end

  class Tr2CurveExpression < Black::Object
    array_reader(:inputs)
    string_reader(:name)
  end

  class Tr2CurveEulerRotationExpression < Tr2CurveExpression
    string_reader(:expressionYaw)
    string_reader(:expressionPitch)
    string_reader(:expressionRoll)
  end

  class Tr2CurveScalarExpression < Tr2CurveExpression
    string_reader(:expression)
    float_reader(:input1)
    float_reader(:input2)
    float_reader(:input3)
  end

  class Tr2ScalarExprKey < Black::Object
    float_reader(:input1)
    float_reader(:input2)
    float_reader(:input3)
    uint_reader(:interpolation)
    float_reader(:left)
    float_reader(:right)
    float_reader(:time)
    string_reader(:timeExpression)
    float_reader(:value)
  end

  class Tr2ScalarExprKeyCurve < Black::Object
    uint_reader(:interpolation)
    array_reader(:keys)
    string_reader(:name)
  end

  class Tr2CurveVector3Expression < Tr2CurveExpression
    string_reader(:expressionX)
    string_reader(:expressionY)
    string_reader(:expressionZ)
  end

  class Tr2CurveSetRange < Black::Object
    float_reader(:endTime)
    boolean_reader(:looped)
    string_reader(:name)
    float_reader(:startTime)
  end

  class Tr2DistanceTracker < Black::Object
    string_reader(:name)
    vector3_reader(:direction)
    vector3_reader(:targetPosition)
  end

  class Tr2Effect < Black::Object
    string_reader(:effectFilePath)
    string_reader(:name)
    array_reader(:parameters)
    array_reader(:resources)

    black_reader(:constParameters) do |reader|
      length = reader.read_u32

      raise ArgumentError, "unexpected content in .black" unless reader.read_u16 == 0x0018

      length.times.map do
        key = reader.read_string_u16

        raise ArgumentError, "unexpected content in .black" unless reader.read_u16 == 0
        raise ArgumentError, "unexpected content in .black" unless reader.read_u16 == 0
        raise ArgumentError, "unexpected content in .black" unless reader.read_u16 == 0

        value = reader.read_f32x4

        [key, value]
      end.to_h
    end

    black_reader(:options) do |reader|
      options_count = reader.read_u32
      options_length = reader.read_u16

      raise ArgumentError, "unexpected content in .black" unless options_length == 0x10

      options_count.times.map do
        options_reader = reader.read_binary(options_length)

        key = options_reader.read_string_u16
        unknown = 5.times.map do |r|
          value = options_reader.read_u16
          options_reader.strings.fetch(value) if value != 0
        end

        {
          "key" => key,
          "unknown" => unknown
        }
      end
    end

    black_reader(:samplerOverrides) do |reader|
      override_count = reader.read_u32
      override_length = reader.read_u16

      raise ArgumentError, "unexpected content in .black" unless override_length == 40

      override_count.times.map do
        override_reader = reader.read_binary(override_length)

        {
          "name" => override_reader.read_string_u32,
          "unknown" => 9.times.map { override_reader.read_u32 }
        }
      end
    end
  end

  class Tr2Emitter < Black::Object
    string_reader(:name)
    object_reader(:particleSystem)
  end

  class Tr2DynamicEmitter < Tr2Emitter
    array_reader(:generators)
    uint_reader(:maxParticles)
    float_reader(:rate)
  end

  class Tr2StaticEmitter < Tr2Emitter
    string_reader(:geometryResourcePath)
    uint_reader(:meshIndex)
  end

  class Tr2GpuSharedEmitter < Tr2Emitter
    float_reader(:angle)
    vector3_reader(:attractorPosition)
    float_reader(:attractorStrength)
    vector4_reader(:color0)
    vector4_reader(:color1)
    vector4_reader(:color2)
    vector4_reader(:color3)
    float_reader(:colorMidpoint)
    boolean_reader(:continuousEmitter)
    vector3_reader(:direction)
    float_reader(:drag)
    float_reader(:emissionDensity)
    float_reader(:gravity)
    float_reader(:maxDisplacement)
    float_reader(:maxEmissionDensity)
    float_reader(:maxLifeTime)
    float_reader(:maxSpeed)
    float_reader(:minLifeTime)
    float_reader(:minSpeed)
    vector3_reader(:position)
    float_reader(:inheritVelocity)
    float_reader(:innerAngle)
    float_reader(:radius)
    float_reader(:rate)
    float_reader(:sizeVariance)
    vector3_reader(:sizes)
    boolean_reader(:scaledByParent)
    uint_reader(:textureIndex)
    float_reader(:turbulenceAmplitude)
    float_reader(:turbulenceFrequency)
    float_reader(:velocityStretchRotation)
  end

  class Tr2GpuUniqueEmitter < Tr2GpuSharedEmitter
  end

  class Tr2ForceSphereVolume < Black::Object
    array_reader(:forces)
    float_reader(:radius)
  end

  class Tr2InstancedMesh < Black::Object
    array_reader(:additiveAreas)
    array_reader(:decalAreas)
    array_reader(:depthAreas)
    array_reader(:distortionAreas)
    string_reader(:geometryResPath)
    string_reader(:instanceGeometryResPath)
    object_reader(:instanceGeometryResource)
    uint_reader(:instanceMeshIndex)
    vector3_reader(:minBounds)
    vector3_reader(:maxBounds)
    array_reader(:opaqueAreas)
    array_reader(:transparentAreas)
  end

  class Tr2InteriorPlaceable < Black::Object
    string_reader(:placeableResPath)
    object_reader(:transform, id: nil)
  end

  class Tr2InteriorScene < Black::Object
    array_reader(:dynamics)
    array_reader(:lights)
  end
  
  class Tr2InteriorLightSource < Black::Object
    vector4_reader(:color)
    float_reader(:coneAlphaInner)
    float_reader(:coneAlphaOuter)
    vector3_reader(:coneDirection)
    float_reader(:falloff)
    float_reader(:importanceBias)
    float_reader(:importanceScale)
    object_reader(:kelvinColor)
    string_reader(:name)
    vector3_reader(:position)
    float_reader(:radius)
    boolean_reader(:useKelvinColor)
  end

  class Tr2IntSkinnedObject < Black::Object
    array_reader(:curveSets)
    object_reader(:transform, id: nil)
    object_reader(:visualModel)
  end

  class Tr2KelvinColor < Black::Object
    float_reader(:temperature)
    float_reader(:tint)
  end

  class Tr2Light < Black::Object
    string_reader(:name)
  end

  class Tr2Model < Black::Object
    array_reader(:meshes)
  end

  class Tr2PointLight < Tr2Light
    float_reader(:brightness)
    vector4_reader(:color)
    float_reader(:noiseAmplitude)
    float_reader(:noiseFrequency)
    float_reader(:noiseOctaves)
    vector3_reader(:position)
    float_reader(:radius)
  end

  class Tr2LodResource < Black::Object
    string_reader(:name)
    string_reader(:highDetailResPath)
    string_reader(:lowDetailResPath)
    string_reader(:mediumDetailResPath)
  end

  class Tr2Mesh < Black::Object
    array_reader(:additiveAreas)
    array_reader(:decalAreas)
    boolean_reader(:deferGeometryLoad)
    array_reader(:depthAreas)
    array_reader(:depthNormalAreas)
    array_reader(:distortionAreas)
    string_reader(:geometryResPath)
    uint_reader(:meshIndex)
    string_reader(:name)
    array_reader(:opaqueAreas)
    array_reader(:opaquePrepassAreas)
    array_reader(:pickableAreas)
    array_reader(:transparentAreas)
  end

  class Tr2MeshArea < Black::Object
    uint_reader(:count)
    object_reader(:effect)
    uint_reader(:index)
    string_reader(:name)
    boolean_reader(:reversed)
    boolean_reader(:useSHLighting)
  end

  class Tr2MeshLod < Black::Object
    array_reader(:additiveAreas)
    array_reader(:associatedResources)
    array_reader(:decalAreas)
    array_reader(:depthAreas)
    array_reader(:distortionAreas)
    object_reader(:geometryRes)
    array_reader(:opaqueAreas)
    array_reader(:pickableAreas)
    array_reader(:transparentAreas)
  end

  class Tr2Parameter < Black::Object
    string_reader(:name)
  end

  class Tr2ExternalParameter < Tr2Parameter
    object_reader(:destinationObject)
    string_reader(:destinationAttribute)
  end

  class Tr2FloatParameter < Tr2Parameter
    float_reader(:value)
  end
  
  class Tr2Matrix4Parameter < Tr2Parameter
    matrix_reader(:value)
  end
  
  class Tr2Texture2dLodParameter < Tr2Parameter
    object_reader(:lodResource)
  end

  class Tr2Vector4Parameter < Tr2Parameter
    vector4_reader(:value)
  end

  class Tr2ParticleElementDeclaration < Black::Object
    TYPE = {
      0 => "LIFETIME",
      1 => "POSITION",
      2 => "VELOCITY",
      3 => "MASS"
    }

    string_reader(:customName)
    uint_reader(:dimension)
    uint_reader(:usageIndex)
    boolean_reader(:usedByGPU)

    black_reader(:elementType) do |reader|
      TYPE.fetch(reader.read_u32)
    end
  end

  class Tr2ParticleForce < Black::Object
  end

  class Tr2ParticleAttractorForce < Tr2ParticleForce
    float_reader(:magnitude)
    vector3_reader(:position)
  end

  class Tr2ParticleDirectForce < Tr2ParticleForce
    vector3_reader(:force)
  end

  class Tr2ParticleDragForce < Tr2ParticleForce
    float_reader(:drag)
  end

  class Tr2ParticleFluidDragForce < Tr2ParticleForce
    float_reader(:drag)
  end

  class Tr2ParticleTurbulenceForce < Tr2ParticleForce
    vector3_reader(:amplitude)
    vector4_reader(:frequency)
    float_reader(:noiseLevel)
    float_reader(:noiseRatio)
  end

  class Tr2ParticleVortexForce < Tr2ParticleForce
    vector3_reader(:axis)
    float_reader(:magnitude)
    vector3_reader(:position)
  end
  
  class Tr2ParticleSpring < Black::Object
    vector3_reader(:position)
    float_reader(:springConstant)
  end

  class Tr2ParticleSystem < Black::Object
    array_reader(:constraints)
    string_reader(:name)
    boolean_reader(:applyAging)
    boolean_reader(:applyForce)
    array_reader(:elements)
    object_reader(:emitParticleDuringLifeEmitter)
    object_reader(:emitParticleOnDeathEmitter)
    array_reader(:forces)
    uint_reader(:maxParticleCount)
    boolean_reader(:requiresSorting)
    boolean_reader(:updateBoundingBox)
    boolean_reader(:updateSimulation)
    boolean_reader(:useSimTimeRebase)
  end
  
  class Tr2GpuParticleSystem < Black::Object
    object_reader(:clear)
    object_reader(:emit)
    object_reader(:render)
    object_reader(:setDrawParameters)
    object_reader(:setSortParameters)
    object_reader(:sort)
    object_reader(:sortInner)
    object_reader(:sortStep)
    object_reader(:update)
  end

  class Tr2PostProcess < Black::Object
    array_reader(:stages)
  end

  class Tr2RuntimeInstanceData < Black::Object
  end

  class Tr2ShLightingManager < Black::Object
    float_reader(:primaryIntensity)
    float_reader(:secondaryIntensity)
  end
  
  class Tr2SkinnedModel < Black::Object
    string_reader(:geometryResPath)
    array_reader(:meshes)
    string_reader(:name)
    string_reader(:skeletonName)
  end
  
  class Tr2StateMachine < Black::Object
    string_reader(:name)
    array_reader(:states)
    uint_reader(:startState)
  end

  class Tr2StateMachineState < Black::Object
    array_reader(:actions)
    object_reader(:finalizer)
    string_reader(:name)
    array_reader(:transitions)
  end

  class Tr2StateMachineTransition < Black::Object
    string_reader(:condition)
    string_reader(:name)
  end
  
  class Tr2SyncToAnimation < Black::Object
  end
end
