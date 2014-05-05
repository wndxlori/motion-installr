[![Gem Version](https://badge.fury.io/rb/motion-installr.svg)](http://badge.fury.io/rb/motion-installr)

# motion-installr

Just like motion-testflight and motion-hockeyapp, motion-installr is a gem to make it easy to configure your application for ad-hoc distribution, but unlike the overly complicated TestFlight and HockeyApp, everything is super easy with Installr. Also I'm not being paid to run this, I just really like Installr.

## Installation

Add this line to your RubyMotion app's Gemfile:

    gem 'motion-installr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-installr

And require it in your Rakefile:

    require 'motion-installr'

## Usage

Once you've got it installed, you're going to need a account with Installr, so head on over and [sign up for one of their free plans](http://installrapp.com/) that lets you share with 1-5 testers.

With your account set up, you're going to need 3 things. A distribution certificate and provisioning profile, which you can create in the iOS dev center, and to find your Installr API key, which you can generate and copy from ['My Account'](https://www.installrapp.com/dashboard/index#/account) on the Installr website.

For instructions on setting up your certificates and profiles, watch [Episode 22 of MotionInMotion - "Distribute your RubyMotion apps with TestFlight and HockeyApp"](https://motioninmotion.tv/screencasts/23).

Now for the super easy part.

Inside of your setup block in your Rakefile, configure the following.

```ruby
Motion::Project::App.setup do |app|
  # ...
  app.installrapp do
    app.codesign_certificate = 'iPhone Distribution: Jane Doe (S0M3T3AM1D)'
    app.provisioning_profile = '/path/to/your/provisioning/profile.mobileprovision'
    app.entitlements['get-task-allow'] = false
    app.installr_api_token = 'YOUR API TOKEN HERE'
  end
  # ...
end
```

Super simple, just set these four settings.

Now you can run `rake installr notes="My Release Notes"` to push a build to Installr and then invite your testers.

Note that `notes="My Release Notes"` is just an environment variable, so you can just write a bash script to set the notes variable and keep track of your notes in there, I show you show to do this in Episode 22 as well.

## Contributing

1. Fork it ( http://github.com/FluffyJack/motion-installr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
