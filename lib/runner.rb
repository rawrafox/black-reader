require "black"
require "pathname"
require "rake"
require "red"
require "uri"

if $0 == __FILE__
  manager = Black::ResourceManager.new
  manager.add_loader("res", eve: "resfileindex.txt", url: "https://resources.eveonline.com/")
  manager.add_loader("wgl", wgl: "res.1097993.json", url: "https://developers.eveonline.com/ccpwgl/assetpath/1097993/")
  manager.add_reader(".black", reader: Black::Reader.new)
  manager.add_reader(".red", reader: Red::Reader.new)
  if ARGV[0] == "-f"
    output = Pathname.new(ARGV[2])
    File.read(ARGV[1]).each_line do |uri|
      uri = URI(uri.strip)
      puts uri
      output_path = (output / uri.path[1 ..].ext('gingerbread'))
      output_path.parent.mkpath
      output_path.write(Black::Gingerbread.dump(manager.load(uri)))
    end
  else
    ARGV.each do |uri|
      puts Black::Gingerbread.dump(manager.load(uri))
    end
  end
end
