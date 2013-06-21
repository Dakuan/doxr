# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doxr/version'

Gem::Specification.new do |spec|
  spec.name          = "doxr"
  spec.version       = Doxr::VERSION
  spec.authors       = ["Dakuan"]
  spec.email         = ["dom.barker808@gmail.com"]
  spec.description   = %q{Imports .docx files}
  spec.summary       = %q{Import .docx files like a boss}
  spec.homepage      = "https://github.com/Dakuan/doxr"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"
end
