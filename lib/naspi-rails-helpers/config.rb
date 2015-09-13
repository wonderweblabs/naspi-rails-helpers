module NaspiRailsHelpers
  class Config

    def initialize
      @config = {}
      @environments = []
      mergeNaspiConfig
      mergeNaspiUserConfig
      mergeEnvironments
    end

    def option(key, env_name = nil)
      env_name ||= ::Rails.env
      @config[env_name][key]
    end


    private

    def mergeNaspiConfig
      path = File.join(NaspiRailsHelpers.root, NaspiRailsHelpers.config_file)
      return unless File.exist?(path)

      mergeConfigFile(path)
    end

    def mergeNaspiUserConfig
      path = File.join(NaspiRailsHelpers.root, NaspiRailsHelpers.user_config_file)
      return unless File.exist?(path)

      mergeConfigFile(path)
    end

    def mergeConfigFile(path)
      yaml = YAML.load_file(path) || {}

      @config.merge!(yaml)
    end

    def mergeEnvironments
      @environments = @config.keys
      config        = {}

      @environments.each do |env_name|
        if env_name != 'defaults'
          config[env_name] = {}.merge(@config['defaults'])
        end
      end

      @environments.each do |env_name|
        if env_name != 'defaults'
          config[env_name] = config[env_name].merge(@config[env_name])
        end
      end

      @config = config
    end

  end
end