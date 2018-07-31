# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peoplehr/version'

Gem::Specification.new do |spec|
  spec.name          = "peoplehr"
  spec.version       = PeopleHR::VERSION
  spec.authors       = ["Rob Miller"]
  spec.email         = ["rob@bigfish.co.uk"]

  spec.summary       = %q{A library for interacting with the PeopleHR API}
  spec.description   = %q{A library for interacting with the PeopleHR API to export and manipulate employee and other information.}
  spec.homepage      = "https://github.com/robmiller/peoplehr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "addressable", "~> 2.5"
  spec.add_runtime_dependency "faraday", "~> 0.15.2"
  spec.add_runtime_dependency "typhoeus", "~> 1.3"
  spec.add_runtime_dependency "transproc", "~> 1.0"
  spec.add_runtime_dependency "virtus", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec"
end
