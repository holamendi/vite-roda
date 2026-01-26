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

`app.rb`

```ruby
require "roda"
require "vite_roda"

class App < Roda
  plugin :render
  plugin :vite

  route do |r|
    # serve static files (including built vite assets)
    r.public

    r.root do
      view :index
    end
  end
end
```

`views/index.erb`

```erb
<!DOCTYPE html>
<html>
<head>
  <%= vite_client_tag %>
  <%= vite_javascript_tag "entrypoints/application.js" %>
</head>
<body>
  <h1>Hello, Vite!</h1>
</body>
</html>
```

## View Helpers

- `vite_client_tag` - HMR client script (development only)
- `vite_javascript_tag(*names)` - Script tags with automatic CSS imports
- `vite_stylesheet_tag(*names)` - Stylesheet link tags
- `vite_asset_path(name)` - Raw asset path

## Configuration

Configuration is handled by vite_ruby via `config/vite.json`. See the [vite_ruby documentation](https://vite-ruby.netlify.app/config/).

## Development

```bash
bundle install
bundle exec rake # run linter and tests
bundle exec rake test # run tests only
bundle exec rake standard:fix # auto-fix linter issues
```
