require "float-formats"
require "pp"

class BinaryReader
  attr_reader :offset

  attr_accessor :strings
  attr_accessor :references

  def initialize(data, offset: 0, size: data.bytesize - offset, strings: nil, references: nil)
    @data = data.force_encoding("BINARY")
    @start = @offset = offset
    @end = @start + size
    @strings = strings
    @references = references

    raise ArgumentError if @end > @data.bytesize
  end

  def at_end?
    @offset == @end
  end

  private def offset(n)
    if @offset + n <= @end
      offset = @offset
      @offset += n
      offset
    else
      raise ArgumentError, "reading beyond end of stream #{@offset} + #{n} (#{@start} .. #{@end})"
    end
  end

  def skip(n)
    offset(n)
  end

  def rewind(n)
    offset(-n)
  end

  def read(n = @end - @offset)
    @data[offset(n), n]
  end

  def read_binary(n)
    BinaryReader.new(@data, offset: offset(n), size: n, strings: @strings, references: @references)
  end

  def read_cstring
    result = @data.unpack1("@#{@offset}Z*")
    byte = @data.unpack1("@#{@offset + result.bytesize}c")

    raise ArgumentError, "something went wrong?" unless byte == 0

    offset(result.bytesize + 1)
    result
  end

  def read_string_u16
    @strings.fetch(self.read_u16)
  end

  def read_string_u32
    @strings.fetch(self.read_u32)
  end

  def read_reference_u32
    @references.fetch(self.read_u32)
  end

  def read_f16
    Flt::IEEE_binary16.from_bytes(self.read(2)).to(Float)
  end

  def read_f32
    self.read(4).unpack1("e")
  end

  def read_f64
    self.read(8).unpack1("E")
  end

  def read_f32x2
    2.times.map { self.read_f32 }
  end

  def read_f32x3
    3.times.map { self.read_f32 }
  end

  def read_f32x4
    4.times.map { self.read_f32 }
  end

  def read_i8
    self.read(1).unpack1("c")
  end

  def read_i16
    self.read(2).unpack1("s<")
  end

  def read_i32
    self.read(4).unpack1("l<")
  end

  def read_u8
    self.read(1).unpack1("C")
  end

  def read_u16
    self.read(2).unpack1("v")
  end

  def read_u32
    self.read(4).unpack1("V")
  end

  def unknown
    remaining = @end - @offset
    readahead = [remaining, 8192].min

    result = {}
    result[:u8] = self.read_u8.tap { self.rewind(1) } if remaining >= 1
    result[:u16] = self.read_u16.tap { self.rewind(2) } if remaining >= 2
    result[:u32] = self.read_u32.tap { self.rewind(4) } if remaining >= 4
    result[:float] = self.read_f32.tap { self.rewind(4) } if remaining >= 4
    result[:hex] = self.read(readahead).tap { self.rewind(readahead) }.unpack1("H*").scan(/../).join(" ") if remaining > 0
    result[:strings] = @strings.each_with_index.map { |e, i| [[i].pack("s").unpack1("H*"), e] }.to_h if remaining > 0
    result[:remaining_bytes] = remaining

    result
  end

  def unknown!
    raise Exception, "Reached unknown data! #{self.unknown.pretty_inspect}"
  end

  def remaining_data
    @data[@offset ... @end]
  end
end
