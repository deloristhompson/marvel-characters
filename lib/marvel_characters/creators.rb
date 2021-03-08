# frozen_string_literal: true

module MarvelCharacters
  class Creators
    QUERYNAME = 'creators'

    def self.find(id)
      MarvelCharacters::QueryBuilder.find(QUERYNAME, id)
    end

    def self.all
      MarvelCharacters::QueryBuilder.all(QUERYNAME)
    end

    def self.where(params)
      MarvelCharacters::QueryBuilder.query_builder(QUERYNAME, params)
    end
  end
end