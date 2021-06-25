# frozen_string_literal: true

require 'marvel_characters/version'
require 'net/http' # TODO: Remove
require 'sinatra' # TODO: Remove
# require 'pry'
require 'marvel_characters/configuration'
require 'marvel_characters/comics'
require 'marvel_characters/characters'
# autoload :Configuration, 'marvel_characters/configuration'
require 'marvel_characters/creators'
require 'marvel_characters/events'
require 'marvel_characters/series'
require 'marvel_characters/stories'
# TODO: Create Specs
require 'marvel_characters/query_builder'

# TODO: Remove this and switch to Ruby Installed HTTP <-------
require 'http'

module MarvelCharacters
  MARVEL_BASE_URL = 'https://gateway.marvel.com:443/v1/public/'
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
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end
end
