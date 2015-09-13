module NaspiRailsHelpers
  class Engine < ::Rails::Engine
    isolate_namespace NaspiRailsHelpers
    engine_name 'naspi-rails-helpers'

    # add naspi helpers to app
    initializer 'naspi-rails-helpers.add_helpers' do |app|
      ActiveSupport.on_load(:action_view) do
        include NaspiRailsHelpers::AssetsIncludeHelper
      end
    end

    # startup
    initializer 'naspi-rails-helpers.load_app_root' do |app|
      NaspiRailsHelpers.rails_app = app
      NaspiRailsHelpers.root = app.root
      NaspiRailsHelpers.config ||= NaspiRailsHelpers::Config.new
      NaspiRailsHelpers.manifest ||= NaspiRailsHelpers::Manifest.new
    end

  end
end
