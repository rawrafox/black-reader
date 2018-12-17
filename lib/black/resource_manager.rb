require "csv"
require "faraday"
require "json"
require "pathname"

module Black
  class ResourceLoader
    attr_reader :index
    attr_reader :url

    attr_accessor :cache

    def initialize(index, url:)
      @index = index
      @url = url
      @cache = nil
    end

    def load(path)
      cache_path = (@cache / path[1 ..])

      if cache_path.exist?
        cache_path.read
      else
        url = @url.dup
        url.path += @index.dig(path, :path)

        response = Faraday.get(url)

        case response.status
        when 200
          response.body.tap do |body|
            cache_path.parent.mkpath
            cache_path.write(body)
          end
        else
          raise response.inspect
        end
      end
    end
  end

  class EVEResourceLoader < ResourceLoader
    def initialize(index, url:)
      index = CSV.parse(File.read(index)).map do |res, path, hash, cs, us|
        k = URI(res.gsub(" ", "%20")).path
        v = {
          path: path,
          hash: hash,
          size: [cs, us]
        }

        [k, v]
      end.to_h

      super(index, url: url)
    end
  end

  class WebGLResourceLoader < ResourceLoader
    def initialize(index, url:)
      index = JSON.parse(File.read(index)).map do |k, v|
        ["/#{k.gsub(" ", "%20")}", { path: v }]
      end.to_h

      super(index, url: url)
    end
  end

  class ResourceManager
    def initialize(cache: Pathname.new("cache"))
      @loaders = {}
      @readers = {}
      @cache = cache
    end

    def add_loader(scheme, eve: eve_missing = true, direct: direct_missing = true, wgl: wgl_missing = true, url:)
      url = URI(url)

      loader = case [eve_missing, direct_missing, wgl_missing]
      when [nil, true, true]
        EVEResourceLoader.new(eve, url: url)
      when [true, nil, true]
        DirectResourceLoader.new(direct, url: url)
      when [true, true, nil]
        WebGLResourceLoader.new(wgl, url: url)
      else
        raise ArgumentError
      end

      loader.cache = @cache / scheme

      @loaders[scheme] = loader
    end

    def add_reader(extension, reader:)
      @readers[extension] = reader
    end

    def load(url)
      url = URI(url)
      loader = @loaders.fetch(url.scheme)
      reader = @readers.fetch(File.extname(url.path))

      reader.read(loader.load(url.path))
    end
  end
end
