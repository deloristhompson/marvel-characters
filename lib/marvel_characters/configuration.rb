# frozen_string_literal: true

module MarvelCharacters
  # TODO: Create specs
  class Configuration
    # Allow accessing the api_version variable
    attr_accessor :api_version

    def initialize
      # Current Marvel API version
      @api_version = 1
    end
  end
end
