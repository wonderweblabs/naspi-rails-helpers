module NaspiRailsHelpers
  module AssetsIncludeHelper

    def naspi_stylesheet_link_tag(*sources)
      options = sources.extract_options!.stringify_keys

      sources.uniq.map { |source|
        tag_options = {
          "rel" => "stylesheet",
          "media" => "screen",
          "href" => naspi_file_path("#{source}.css")
        }.merge!(options)
        tag(:link, tag_options)
      }.join("\n").html_safe
    end

    def naspi_javascript_include_tag(*sources)
      options = sources.extract_options!.stringify_keys

      sources.uniq.map { |source|
        tag_options = {
          "src" => naspi_file_path("#{source}.js")
        }.merge!(options)
        content_tag(:script, "", tag_options)
      }.join("\n").html_safe
    end

    def naspi_html_link_tag(*sources)
      options = sources.extract_options!.stringify_keys
      inline = options.delete('inline')

      if inline == true
        sources.uniq.map { |source|
          file = naspi_file_absolute_path("#{source}.html")

          File.read(file)
        }.join("\n").html_safe
      else
        sources.uniq.map { |source|
          tag_options = {
            "rel" => "import",
            "href" => naspi_file_path("#{source}.html")
          }.merge!(options)
          tag(:link, tag_options)
        }.join("\n").html_safe
      end
    end

    def naspi_image_url(path)
      naspi_file_path(path)
    end

    def naspi_image_tag(path, options = {})
      tag_options = options.merge({ src: naspi_file_path(path) })

      tag(:img, tag_options)
    end

    def naspi_file_path(path)
      NaspiRailsHelpers.manifest.resolve_path(path)
    end

    def naspi_file_absolute_path(path)
      NaspiRailsHelpers.manifest.resolve_absolute_path(path)
    end

  end
end