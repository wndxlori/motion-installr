unless defined?(Motion::Project::Config)
  raise 'This file must be required within a RubyMotion project Rakefile.'
end

module Motion; module Project; class Config
  attr_accessor :installrapp_mode

  variable :installr_api_token

  def installrapp(&block)
    yield self if block_given? && installrapp_mode?
  end

  def installrapp_mode?
    @installrapp_mode == true
  end
end; end; end

namespace 'installr' do
  desc 'Submit an archive to InstallrApp'
  task :submit do
    App.config_without_setup.installrapp_mode = true

    release_notes = ENV['notes']
    App.fail 'You forgot to write some release notes' unless release_notes

    Rake::Task['archive'].invoke

    curl = "curl https://www.installrapp.com/apps.json -H \"X-InstallrAppToken: #{App.config.installr_api_token}\" -F qqfile=@\"#{App.config.archive}\" -F releaseNotes=\"#{release_notes}\" -F notify=true"

    App.info 'Run', curl.gsub(App.config.installr_api_token, '*********')
    sh curl
  end
end

desc 'Same as installr:submit'
task 'installr' => 'installr:submit'
