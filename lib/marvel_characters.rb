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
  MARVEL_END_POINT = 'https://gateway.marvel.com:443/v1/public/'

  # TODO: Remove these as the classes are built
  CREATORS_END_POINT = 'https://gateway.marvel.com:443/v1/public/creators?'
  EVENTS_END_POINT = 'https://gateway.marvel.com:443/v1/public/events?'
  SERIES_END_POINT = 'https://gateway.marvel.com:443/v1/public/series?'
  STORIES_END_POINT = 'https://gateway.marvel.com:443/v1/public/stories?'
  # END TODO

  autoload :Comics, 'marvel_characters/comics.rb'
  autoload :Characters, 'marvel_characters/characters.rb'
  autoload :Configuration, 'marvel_characters/configuration.rb'

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
