require "black/binary_reader"
require "nokogiri"

module Red
  class Reader
    def initialize
      @bin = BinReader.new
      @xml = XMLReader.new
    end

    def read(data)
      if data[0 .. 5] == "binred"
        @bin.read(data)
      else
        @xml.read(data)
      end
    end
  end

  class BinReader
    ID_BIT = (1 << 6)
    REFERENCE_BIT = (1 << 7)

    NONE = 0
    BOOL = 1
    INT = 2
    UINT = 3
    FLOAT = 4
    STRING = 5
    ARRAY = 6
    MAPPING = 7
    OBJECT = 8
    TYPED_ARRAY = 9
    TYPED_MAPPING = 10

    SMALL = 0
    MEDIUM = (1 << 4)
    LARGE = (2 << 4)
    
    def read(data)
      reader = BinaryReader.new(data)

      if reader.read(6) != "binred"
        raise ArgumentError, "not a binary .red file"
      end

      strings = Array.new
      reader.read_u32.times do
        strings << reader.read(reader.read_u16)
      end

      read_element(reader, strings: strings, references: Hash.new).tap do
        raise ArgumentError, "not at end" unless reader.at_end?
      end
    end

    private def read_element(reader, strings:, references:)
      type = reader.read_u8

      if type == REFERENCE_BIT
        id = reader.read_u16

        return references.fetch(id)
      elsif (type & ID_BIT) != 0
        id = reader.read_u16
      else
        id = nil
      end

      read_element_data(reader, type: type & 0x3F, strings: strings, references: references).tap do |result|
        references[id] = result unless id.nil?
      end
    end
    
    private def read_element_data(reader, type:, strings:, references:)
      case type & 0x0F
      when NONE
        nil
      when BOOL
        read_bool(reader, type: type)
      when INT
        read_int(reader, type: type)
      when UINT
        read_uint(reader, type: type)
      when FLOAT
        read_float(reader, type: type)
      when STRING
        read_string(reader, type: type, strings: strings)
      when ARRAY
        read_uint(reader, type: type).times.map do
          read_element(reader, strings: strings, references: references)
        end
      when MAPPING, OBJECT
        read_uint(reader, type: type).times.map do
          key = strings.fetch(read_uint(reader, type: type))
          value = read_element(reader, strings: strings, references: references)

          [key, value]
        end.to_h
      when TYPED_ARRAY
        count = read_uint(reader, type: type)
        element_type = reader.read_u8

        count.times.map do
          read_element_data(reader, type: element_type, strings: strings, references: references)
        end
      when TYPED_MAPPING
        count = read_uint(reader, type: type)
        element_type = reader.read_u8

        count.times.map do
          k = read_string(reader, type: type, strings: strings)
          v = read_element_data(reader, type: element_type, strings: strings, references: references)

          [k, v]
        end.to_h
      else
        raise ArgumentError, "not implemented type #{type}"
      end
    end

    private def read_bool(reader, type:)
      case type & 0x30
      when LARGE
        true
      when MEDIUM
        false
      else
        reader.read_u8 != 0
      end
    end

    private def read_float(reader, type:)
      case type & 0x30
      when LARGE
        reader.read_f64
      when MEDIUM
        reader.read_f32
      else
        reader.read_f16
      end
    end
    
    private def read_int(reader, type:)
      case type & 0x30
      when LARGE
        reader.read_i32
      when MEDIUM
        reader.read_i16
      else
        reader.read_i8
      end
    end
    
    private def read_string(reader, type:, strings:)
      strings.fetch(read_uint(reader, type: type))
    end

    private def read_uint(reader, type:)
      case type & 0x30
      when LARGE
        reader.read_u32
      when MEDIUM
        reader.read_u16
      else
        reader.read_u8
      end
    end
  end

  class XMLReader
    def read(data)
      xml = Nokogiri::XML(data)
    end
  end
end
