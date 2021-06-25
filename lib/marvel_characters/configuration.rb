# frozen_string_literal: true

module MarvelCharacters
  # TODO: Create specs
  class Configuration
    attr_writer :public_key, :private_key
    # Allow accessing the api_version variable
    attr_accessor :api_version

    def initialize
      @public_key = nil
      @private_key = nil
      @end_point = 'https://gateway.marvel.com:443/v1/public/'
      # Current Marvel API version
      @api_version = 1
    end

    def private_key
      raise 'Missing ENV for Private key' unless @private_key

      @private_key
    end

    def public_key
      raise 'Missing ENV for Public key' unless @public_key

      @public_key
    end
  end
end
