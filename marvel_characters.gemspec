# frozen_string_literal: true

require_relative 'lib/marvel_characters/version'

Gem::Specification.new do |spec|
  spec.name          = 'marvel_characters'
  spec.version       = MarvelCharacters::VERSION
  spec.authors       = ['Deloris Thompson']
  spec.email         = ['deloris@echobind.com']

  spec.summary       = 'Message Write a short summary, because RubyGems requires one.'
  spec.description   = 'Message Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/deloristhompson/marvel-characters.git'
  spec.license       = 'MIT'
  # spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/deloristhompson/marvel-characters.git'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_runtime_dependency 'sinatra', '~> 2.1.0'
  spec.add_development_dependency 'http', '~> 4.4', '>= 4.4.1'
  spec.add_development_dependency 'rubocop', '~> 1.9', '>= 1.9.1'
end
