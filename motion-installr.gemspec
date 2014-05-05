# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion/installr/version'

Gem::Specification.new do |spec|
  spec.name          = "motion-installr"
  spec.version       = Motion::Installr::VERSION
  spec.authors       = ["Jack Dean Watson-Hamblin"]
  spec.email         = ["info@fluffyjack.com"]
  spec.summary       = %q{RubyMotion gem for Ad-hoc deployment using the amazing Installr service! https://www.installrapp.com/}
  spec.description   = %q{Just like motion-testflight and motion-hockeyapp, motion-installr is a gem to make it easy to configure your application for ad-hoc distribution, but unlike the overly complicated TestFlight and HockeyApp, everything is super easy with Installr. Also I'm not being paid to run this, I just really like Installr.}
  spec.homepage      = 'https://github.com/FluffyJack/motion-installr'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
