# frozen_string_literal: true

module MarvelCharacters
  class Comics
    # TODO: Remove?
    def self.find(id)
      MarvelCharacters::QueryBuilder.find('comics', id)
    end

    def self.all
      MarvelCharacters::QueryBuilder.all('comics')
    end

    def self.where(params)
      MarvelCharacters::QueryBuilder.query_builder('comics', params)
    end
  end
end
