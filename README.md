# vite_roda

Vite integration for Roda, built on top of [vite_ruby](https://github.com/ElMassimo/vite_ruby).

## Installation

Add to your Gemfile:

```ruby
gem "vite_roda"
```

Run:

```bash
bundle install
bundle exec vite install
```

## Usage

```ruby
require "roda"
require "vite_roda"

class App < Roda
  plugin :render
  plugin :vite

  route do |r|
    r.public  # Serve static files (including built vite assets)

    r.root do
      view "home"
    end
  end
end
```

In your layout:

```erb
<!DOCTYPE html>
<html>
<head>
  <%= vite_client_tag %>
  <%= vite_javascript_tag "entrypoints/application.js" %>
</head>
<body>
  <%= yield %>
</body>
</html>
```

## View Helpers

- `vite_client_tag` - HMR client script (development only)
- `vite_javascript_tag(*names)` - Script tags with automatic CSS imports
- `vite_stylesheet_tag(*names)` - Stylesheet link tags
- `vite_asset_path(name)` - Raw asset path

## Plugin Options

```ruby
plugin :vite,
  skip_proxy: false,  # Disable dev server proxy
  strict: false       # Raise on missing entrypoints (default: warn)
```

## Configuration

Configuration is handled by vite_ruby via `config/vite.json`. See the [vite_ruby documentation](https://vite-ruby.netlify.app/config/).

## Development

```bash
bundle install
bundle exec rake              # Run linter and tests
bundle exec rake test         # Run tests only
bundle exec rake standard:fix # Auto-fix linter issues
```

## License

MIT License. See LICENSE.txt.
