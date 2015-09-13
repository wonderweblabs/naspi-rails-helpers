$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "naspi-rails-helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "naspi-rails-helpers"
  s.version     = NaspiRailsHelpers::VERSION
  s.authors     = ["Sascha Hillig", "Alexander Schrot", "wonderweblabs"]
  s.email       = ["email@wonderweblabs.com"]
  s.homepage    = "https://github.com/wonderweblabs/naspi-rails-helpers"
  s.summary     = "Naspi rails helpers"
  s.description = <<-EOS
    Naspi is an asset pipeline build on nodejs. It generates compiled assets. To
    access those assets easily with rails, this gem provides some helper
    methods therefore.
  EOS
  s.license     = "MIT"

  s.files = Dir[
    "{app,config,db,lib}/**/*",
    ".gitignore",
    "LICENSE",
    "Rakefile",
    "README.md"
  ]
  s.test_files = Dir["spec/**/*"]

end
