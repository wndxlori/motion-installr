unless defined?(Motion::Project::Config)
  raise 'This file must be required within a RubyMotion project Rakefile.'
end

require 'motion/installr/version'
require 'motion/project/installr'
