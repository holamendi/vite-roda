# frozen_string_literal: true

require "vite_ruby"
require "roda"

require_relative "vite_roda/version"
require_relative "vite_roda/tag_helpers"
require_relative "vite_roda/plugin"

ViteRuby::COMPANION_LIBRARIES["vite_roda"] = "roda"

Roda::RodaPlugins.register_plugin(:vite, ViteRoda::Plugin)
