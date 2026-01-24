# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

TEST_ROOT = File.expand_path(__dir__)

require "fileutils"
require "json"
require "minitest/autorun"
require "rack/test"
require "vite_roda"

ViteRuby.reload_with(root: TEST_ROOT)
