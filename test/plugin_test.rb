# frozen_string_literal: true

require "test_helper"

class PluginTest < Minitest::Test
  def setup
    ViteRuby.reload_with(root: TEST_ROOT)
  end

  def app
    @app ||= Class.new(Roda) do
      plugin :vite
    end
  end

  def test_plugin_loads_without_error
    assert app.ancestors.include?(Roda)
  end

  def test_plugin_adds_instance_methods
    assert app.method_defined?(:vite_asset_path)
    assert app.method_defined?(:vite_javascript_tag)
    assert app.method_defined?(:vite_stylesheet_tag)
    assert app.method_defined?(:vite_client_tag)
  end
end
