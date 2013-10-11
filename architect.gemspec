# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'architect/version'

Gem::Specification.new do |spec|
  spec.name          = "uml_architect"
  spec.version       = Architect::VERSION
  spec.authors       = ["Ibrahim Muhammad"]
  spec.email         = ["ibrahim.mohammad@gmail.com"]
  spec.description   = %q{Create UML Class Diagrams using text}
  spec.summary       = %q{Create UML Class Diagrams using a simple yUML like notation}
  spec.homepage      = "https://github.com/whistler/architect"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['architect']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-graphviz"
  spec.add_dependency "libxslt-ruby"
  spec.add_dependency "listen", "2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', "2.10.0"
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'guard-rspec'
end
