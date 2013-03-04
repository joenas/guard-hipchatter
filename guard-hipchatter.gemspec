# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/hipchatter/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-hipchatter"
  spec.version       = Guard::Hipchat::VERSION
  spec.authors       = ["jonnev"]
  spec.email         = ["jonnev@bredband2.se"]
  spec.description   = %q{herro}
  spec.summary       = %q{herro}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "hipchat"
  spec.add_runtime_dependency "guard"

  spec.add_development_dependency "guard-hipchatter"
  spec.add_development_dependency "guard-shell"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
