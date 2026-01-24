# frozen_string_literal: true

require "test_helper"

class TagHelpersTest < Minitest::Test
  include ViteRoda::TagHelpers

  def setup
    ViteRuby.reload_with(root: TEST_ROOT)
    ViteRuby.instance.instance_variable_set(:@running, false)
    ViteRuby.instance.instance_variable_set(:@running_checked_at, Time.now)
  end

  def test_vite_asset_path_returns_manifest_path
    path = vite_asset_path("entrypoints/application.js")

    assert_equal "/vite/assets/application-abc123.js", path
  end

  def test_vite_asset_path_raises_on_missing
    assert_raises(ViteRuby::MissingEntrypointError) do
      vite_asset_path("nonexistent.js")
    end
  end

  def test_vite_javascript_tag_renders_script_and_css
    html = vite_javascript_tag("entrypoints/application.js")
    expected = <<~HTML.chomp
      <link rel="stylesheet" href="/vite/assets/application-def456.css" crossorigin="anonymous">
      <script type="module" src="/vite/assets/application-abc123.js" crossorigin="anonymous"></script>
    HTML

    assert_equal expected, html
  end

  def test_vite_javascript_tag_raises_on_missing
    assert_raises(ViteRuby::MissingEntrypointError) do
      vite_javascript_tag("nonexistent.js")
    end
  end

  def test_vite_stylesheet_tag_renders_link
    html = vite_stylesheet_tag("entrypoints/application.css")
    expected = '<link rel="stylesheet" href="/vite/assets/application-def456.css" crossorigin="anonymous">'

    assert_equal expected, html
  end

  def test_vite_stylesheet_tag_raises_on_missing
    assert_raises(ViteRuby::MissingEntrypointError) do
      vite_stylesheet_tag("nonexistent.css")
    end
  end

  def test_vite_client_tag_returns_empty_when_dev_server_not_running
    html = vite_client_tag

    assert_equal "", html
  end

  def test_vite_client_tag_returns_script_when_dev_server_running
    ViteRuby.instance.instance_variable_set(:@running, true)
    ViteRuby.instance.instance_variable_set(:@running_checked_at, Time.now)

    html = vite_client_tag

    assert_match %r{<script type="module" src="[^"]*@vite/client"></script>}, html
  end
end
