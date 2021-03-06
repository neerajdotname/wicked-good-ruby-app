# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'bundler'
Bundler.require

require 'bubble-wrap/http'
require 'bubble-wrap/reactor'
require 'rspec/core/rake_task'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.release do
    app.provisioning_profile = ENV['WICKED_GOOD_RUBY_PROFILE']     if ENV['WICKED_GOOD_RUBY_PROFILE']
    app.codesign_certificate = ENV['WICKED_GOOD_RUBY_CERTIFICATE'] if ENV['WICKED_GOOD_RUBY_CERTIFICATE']
  end

  app.identifier             = "com.alexrothenberg.wickedgoodrubyconf"
  app.name = 'Wicked Good'
  app.deployment_target = "6.0"
  app.icons = ["icon.png", "icon@2x.png", "icon-ios6.png", "icon-ios6@2x.png"]
  # IOS6 pick up default names ['Default.png', 'Default@2x.png', 'Default-568@2x.png']
  app.info_plist['UILaunchImages'] = [
     {
       'UILaunchImageName' => 'Default-ios7',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{320, 480}'
     },
     {
       'UILaunchImageName' => 'Default-ios7@2x',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{640, 960}'
     },
     {
       'UILaunchImageName' => 'Default-ios7-568h',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{320, 568}'
     },
     {
       'UILaunchImageName' => 'Default-ios7-568h@2x',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{640, 1136}'
     },
     {
       'UILaunchImageName' => 'Default-Portrait-ios7',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{768, 1004}'
     },
     {
       'UILaunchImageName' => 'Default-Portrait-ios7@2x',
       'UILaunchImageMinimumOSVersion' => '7.0',
       'UILaunchImageSize' => '{1536, 2008}'
     }
   ]

  app.interface_orientations = [:portrait]
  app.device_family = [:iphone]

  app.frameworks += %w(CoreLocation MapKit)
  app.pods do
    pod 'MMDrawerController', '~> 0.4.0'
  end
end


task :cucumber => [:'build:simulator', :'calabash:run']
RSpec::Core::RakeTask.new(:rspec) do |config|
  config.pattern = 'rspec/**/*_spec.rb'
  config.rspec_opts = '--default_path rspec'
end
