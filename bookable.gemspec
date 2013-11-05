# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookable/version'

Gem::Specification.new do |spec|
  spec.name          = "bookable"
  spec.version       = Bookable::VERSION
  spec.authors       = ["Srikanth", "Margo", "Jon"]
  spec.email         = ["srikanth.kunkulagunta@gmail.com", "margo@margonline.co.uk", "chewymeister88@googlemail.com"]
  spec.description   = %q{a calendar reservation gem for rails 4.0}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'jbuilder', '~> 1.2'
  spec.add_development_dependency "rake"
end
