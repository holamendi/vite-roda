# frozen_string_literal: true

require_relative "lib/vite_roda/version"

Gem::Specification.new do |spec|
  spec.name = "vite_roda"
  spec.version = ViteRoda::VERSION
  spec.authors = ["Pablo Orellana"]
  spec.email = ["hola@mendi.cl"]

  spec.summary = "Vite integration for Roda"
  spec.description = "Use Vite in Roda with a lean plugin that provides view helpers and dev server proxy."
  spec.homepage = "https://github.com/holamendi/vite_roda"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/holamendi/vite_roda"
  spec.metadata["changelog_uri"] = "https://github.com/holamendi/vite_roda/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "roda", ">= 3.0"
  spec.add_dependency "vite_ruby", "~> 3.0"

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rack-test", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "standard", "~> 1.3"
end
