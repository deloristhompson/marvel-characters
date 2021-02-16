# frozen_string_literal: true

#   Allowed Parameters:
#   Parameter                                           Data Type
#   - name	                                            string
#   - nameStartsWith	                                  string
#   - modifiedSince	                                    Date
#   - comics	                                          int
#   - series	                                          int
#   - events	                                          int
#   - stories	                                          int
#   - orderBy	Fields: name, modified, -name, -modified	string
#   - limit	                                            int
#   - offset	                                          int

module MarvelCharacters
  class Characters
    def self.find(id)
      MarvelCharacters::QueryBuilder.find('characters', id)
    end

    def self.all
      MarvelCharacters::QueryBuilder.all('characters')
    end

    def self.where(params)
      MarvelCharacters::QueryBuilder.query_builder('characters', params)
    end
  end
end
