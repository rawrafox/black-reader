lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "black/version"

Gem::Specification.new do |spec|
  spec.name          = "black-reader"
  spec.version       = Black::VERSION
  spec.authors       = ["Aurora"]
  spec.email         = ["aurora@aventine.se"]

  spec.summary       = "Black Reader"
  spec.description   = "Takes EVE .black files and turn them into something useful"
  spec.homepage      = "http://github.com/rawrasaur/black-reader"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
end
