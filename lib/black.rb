require "black/version"
require "black/binary_reader"
require "black/gingerbread"
require "black/resource_manager"

require "black/object"
require "black/aud"
require "black/eve"
require "black/sof"
require "black/tr2"
require "black/tri"
require "black/wod"

module Black
  class Reader
    def read(data)
      reader = BinaryReader.new(data)

      fourcc = reader.read_u32
      raise ArgumentError, "wrong FOURCC #{fourcc}" unless fourcc == 0xB1ACF11E

      version = reader.read_u32
      raise ArgumentError, "wrong version #{version}" unless version == 1

      reader.strings = read_strings(reader)
      reader.references = {}

      comment_length = reader.read_u32
      _ = reader.read(comment_length).force_encoding("UTF-16LE")

      Black::Object.from(reader)
    end

    private def read_strings(reader)
      strings_reader = reader.read_binary(reader.read_u32)
      strings_count = strings_reader.read_u16

      strings_count.times.map do
        strings_reader.read_cstring
      end
    end
  end
end
