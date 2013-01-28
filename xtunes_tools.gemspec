$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "xtunes_tools/version"

Gem::Specification.new do |s|
  s.name        = 'xtunes_tools'
  s.version     = '0.0.2'
  s.date        = '2012-11-28'
  s.summary     = "xtunes_tools"
  s.description = "xtunes tools collections"
  s.authors     = ["xtunes"]
  s.email       = 'com@xtunes.cn'
  s.files       = Dir["lib/**/*.rb", "recipes/**/*.rb", "defaults/*.yaml"]
  s.homepage    =
    'http://rubygems.org/gems/xtunes'
  s.executables << 'xtunes'

  s.add_dependency "rails_apps_composer" , '~> 2.2.0'
end