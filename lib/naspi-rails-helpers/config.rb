module NaspiRailsHelpers
  class Config

    def initialize
      @config = {}
      @mergeNaspiConfig()
      @mergeNaspiUserConfig()
      puts '---------------------------'
      puts @config
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
      json = File.read(path)
      @config = @config.merge(JSON.parse(json) || {})
    end

  end
end