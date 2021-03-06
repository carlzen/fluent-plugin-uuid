# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'fluent/plugin/uuid/version'

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-uuid"
  spec.version       = "0.0.1" 
  spec.authors       = ["j-o-s-h"]
  spec.email         = ["joshcwa@live.com"]
  spec.description   = %q{Output filter plugin to add uuid to message} 
  spec.summary       =  %q{Output filter plugin to add uuid to message} 
  spec.homepage      = "https://github.com/j-o-s-h/fluent-plugin-uuid"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "fluentd"
end
