# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] - 2026-03-20

### Changed

- Bump vite_ruby dependency to 3.10.0

## [0.1.0] - 2025-01-25

### Added

- Initial release
- Roda plugin with `plugin :vite` registration
- Tag helpers: `vite_client_tag`, `vite_javascript_tag`, `vite_stylesheet_tag`, `vite_asset_path`
- Automatic dev server proxy in development mode
- Strict mode by default (raises on missing entrypoints)
- Example apps for React, Svelte, and Tailwind

[0.1.1]: https://github.com/holamendi/vite_roda/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/holamendi/vite_roda/releases/tag/v0.1.0
