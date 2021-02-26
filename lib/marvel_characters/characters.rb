# frozen_string_literal: true

#   Allowed Parameters: Use safe_params
#   Add help that verifies the params are the right data type
#  Await in the GEM.  Normalize the response
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
    QUERYNAME = 'characters'

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
