module NaspiRailsHelpers
  module AssetsIncludeHelper

    def graspi_stylesheet_link_tag(*sources)
      options = sources.extract_options!.stringify_keys

      sources.uniq.map { |source|
        tag_options = {
          "rel" => "stylesheet",
          "media" => "screen",
          "href" => graspi_file_path("#{source}.css")
        }.merge!(options)
        tag(:link, tag_options)
      }.join("\n").html_safe
    end

    def graspi_javascript_include_tag(*sources)
      options = sources.extract_options!.stringify_keys

      sources.uniq.map { |source|
        tag_options = {
          "src" => graspi_file_path("#{source}.js")
        }.merge!(options)
        content_tag(:script, "", tag_options)
      }.join("\n").html_safe
    end

    def graspi_html_link_tag(*sources)
      options = sources.extract_options!.stringify_keys
      inline = options.delete('inline')

      if inline == true
        sources.uniq.map { |source|
          file = graspi_file_absolute_path("#{source}.html")

          File.read(file)
        }.join("\n").html_safe
      else
        sources.uniq.map { |source|
          tag_options = {
            "rel" => "import",
            "href" => graspi_file_path("#{source}.html")
          }.merge!(options)
          tag(:link, tag_options)
        }.join("\n").html_safe
      end
    end

    def graspi_image_url(path)
      graspi_file_path(path)
    end

    def graspi_image_tag(path, options = {})
      tag_options = options.merge({ src: graspi_file_path(path) })

      tag(:img, tag_options)
    end

    def graspi_file_path(path)
      Graspi.manifest_resolve_path(::Rails.env, path)
    end

    def graspi_file_absolute_path(path)
      Graspi.manifest_resolve_absolute_path(::Rails.env, path)
    end

  end
end