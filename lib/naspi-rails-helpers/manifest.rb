module NaspiRailsHelpers
  class Manifest

    def mapping
      begin
        path = NaspiRailsHelpers.config.option('manifestFile')
        json = File.exist?(path) ? File.read(path) : '{}'
        JSON.parse(json)
      end || {}
    end

    def resolve_path(file)
      mappedPath = mapping["#{file}"]

      mappedPath ? File.join('/', mappedPath) : nil
    end

    def resolve_absolute_path(file)
      mappedPath = resolve_path(file) || ''

      File.join(NaspiRailsHelpers.root, NaspiRailsHelpers.assets_lookup_path, file)
    end

  end
end