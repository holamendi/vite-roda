# frozen_string_literal: true

require_relative "tag_helpers"

module ViteRoda
  module Plugin
    def self.load_dependencies(app, opts = {})
      app.plugin :public
    end

    def self.configure(app, opts = {})
      ViteRuby.bootstrap
      return unless ViteRuby.run_proxy?

      app.use ViteRuby::DevServerProxy, ssl_verify_none: true
    end

    module InstanceMethods
      include ViteRoda::TagHelpers
    end
  end
end
