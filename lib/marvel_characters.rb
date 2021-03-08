# frozen_string_literal: true

require 'marvel_characters/version'
require 'net/http' # TODO: Remove
require 'sinatra' # TODO: Remove
require 'pry'

# TODO: Remove this and switch to Ruby Installed HTTP <-------
require 'http'

module MarvelCharacters
  MARVEL_PUBLIC_KEY = 'cf94c2809a72c81a1f404fc182994e3b'
  MARVEL_PRIVATE_KEY = '9f52540e790e612ee960dc1be5062072919c515d'
  MARVEL_BASE_URL = 'https://gateway.marvel.com:443/v1/public/'

  autoload :Comics, 'marvel_characters/comics.rb'
  autoload :Characters, 'marvel_characters/characters.rb'
  autoload :Configuration, 'marvel_characters/configuration.rb'
  autoload :Creators, 'marvel_characters/creators.rb'
  autoload :Events, 'marvel_characters/events.rb'
  autoload :Series, 'marvel_characters/series.rb'
  autoload :Stories, 'marvel_characters/stories.rb'

  # TODO: Create Specs
  autoload :QueryBuilder, 'marvel_characters/query_builder.rb'
  class Errors
    class ConfigurationError < StandardError; end
  end

  class << self
    # Allow writing to the configuration method
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end
end
