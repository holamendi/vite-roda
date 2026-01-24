# frozen_string_literal: true

module ViteRoda
  module TagHelpers
    def vite_client_tag
      return "" unless ViteRuby.instance.dev_server_running?

      src = ViteRuby.instance.manifest.vite_client_src
      %(<script type="module" src="#{src}"></script>)
    end

    def vite_javascript_tag(*names, **options)
      entries = ViteRuby.instance.manifest.resolve_entries(*names, type: :javascript)
      tags = []

      entries[:stylesheets].each do |src|
        tags << stylesheet_tag(src, **options)
      end

      entries[:scripts].each do |src|
        tags << script_tag(src, **options)
      end

      tags.join("\n")
    end

    def vite_stylesheet_tag(*names, **options)
      names.map do |name|
        src = vite_asset_path(name, type: :stylesheet)
        stylesheet_tag(src, **options)
      end.join("\n")
    end

    def vite_asset_path(name, **options)
      ViteRuby.instance.manifest.path_for(name, **options)
    end

    private

    def script_tag(src, **opts)
      %(<script type="module" src="#{src}" crossorigin="anonymous"></script>)
    end

    def stylesheet_tag(src, **opts)
      %(<link rel="stylesheet" href="#{src}" crossorigin="anonymous">)
    end
  end
end
