require 'rails/all'
require 'yaml'
require 'json'

require 'naspi-rails-helpers/config'
require 'naspi-rails-helpers/manifest'
require 'naspi-rails-helpers/helpers/assets_include_helper'
require 'naspi-rails-helpers/engine'

module NaspiRailsHelpers

  # rails app
  mattr_accessor :rails_app

  # naspi root folder
  mattr_accessor :root

  # config file
  mattr_accessor :config_file
  @@config_file = 'config/naspi.yml'

  # user config file
  mattr_accessor :user_config_file
  @@user_config_file = '.naspi.yml'

  # config
  mattr_accessor :config

  # manifest
  mattr_accessor :manifest

end