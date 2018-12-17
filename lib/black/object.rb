module Black
  class Object
    def self.constructor_name
      self.name.split("::").last
    end

    def self.descendants
      @descendants ||= begin
        ObjectSpace.each_object(Class).select { |e| e < self }.map do |e|
          [e.constructor_name, e]
        end.to_h
      end
    end

    def self.from(reader, id: no_id = true)
      if no_id
        id = reader.read_u32

        return nil if id == 0
        return reader.references.fetch(id) if reader.references.key?(id)
      end

      reader = reader.read_binary(reader.read_u32)
      type = reader.read_string_u16

      klass = self.descendants.fetch(type) do |k|
        raise Exception, "Class #{k} not found"
      end

      result = klass.new
      reader.references[id] = result if id

      until reader.at_end?
        name = reader.read_string_u16

        begin
          result.send("read_#{name}".to_sym, reader)
        rescue NoMethodError => e
          raise Exception, "No reader #{name} for #{result.inspect}, #{reader.unknown.pretty_inspect}"
        end
      end

      result
    end

    def self.black_reader(key, accessor = nil, &block)
      accessor ||= key
      accessor_assignment = "#{accessor}=".to_sym

      self.attr_accessor(accessor)

      define_method("read_#{key}") do |reader|
        self.send(accessor_assignment, self.instance_exec(reader, &block))
      end
    end

    def self.array_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_u32.times.map { Black::Object.from(r) }
      end
    end

    def self.boolean_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_u8 != 0
      end
    end

    def self.byte_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_u8
      end
    end

    def self.float_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_f32
      end
    end

    def self.matrix_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        4.times.map do
          r.read_f32x4
        end
      end
    end

    def self.object_reader(key, accessor = nil, **options)
      self.black_reader(key, accessor) do |r|
        Black::Object.from(r, **options)
      end
    end


    def self.primitive_array_reader(key, accessor = nil, &block)
      self.black_reader(key, accessor) do |r|
        r.read_u32.times { self.instance_exec(r, &block) }
      end
    end

    def self.ushort_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_u16
      end
    end

    def self.string_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_string_u16
      end
    end
    
    def self.uint_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_u32
      end
    end
    
    def self.vector2_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_f32x2
      end
    end
    
    def self.vector3_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_f32x3
      end
    end
    
    def self.vector4_reader(key, accessor = nil)
      self.black_reader(key, accessor) do |r|
        r.read_f32x4
      end
    end
    
    def self.unknown(key, accessor = nil, &block)
      self.black_reader(key, accessor) do |r|
        self.instance_exec(&block) if block
        r.unknown!
      end
    end
  end
end
