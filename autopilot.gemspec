# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autopilot/version'

Gem::Specification.new do |spec|
  spec.name          = "autopilot"
  spec.version       = Autopilot::VERSION
  spec.authors       = ["Lachlan Priest"]
  spec.email         = ["lachlan@advocate.ly"]

  spec.summary       = "Micro gem for Autopilot API"
  spec.description   = "Micro gem for Autopilot API to identify contacts"
  spec.homepage      = "https://github.com/advocately/autopilot-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]


  spec.add_dependency "multi_json"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-around"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
end
