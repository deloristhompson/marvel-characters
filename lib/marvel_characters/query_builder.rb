# frozen_string_literal: true

require 'pry'

# TODO: Look into meta programming/macro
# Function that defines other functions
module MarvelCharacters
  class QueryBuilder
    attr_reader :authorize

    def self.all(end_point)
      authorize
      uri = "#{MARVEL_BASE_URL}#{end_point}?ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.query_builder(end_point, params)
      authorize
      url = ''

      params.each do |key, value|
        url += "#{key}=#{ERB::Util.url_encode(value)}&"
      end

      uri = "#{MARVEL_BASE_URL}#{end_point}?#{url}ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.find(end_point, id)
      authorize
      uri = "#{MARVEL_BASE_URL}#{end_point}/#{id}?ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.authorize
      ts = Time.now.to_i
      md5 = Digest::MD5.new
      md5.update(ts.to_s + MARVEL_PRIVATE_KEY + MARVEL_PUBLIC_KEY)
      @auth = { ts: ts, md5: md5 }
    end

    # TODO: Create
    def self.parse_response
    end
    # END: TODO
  end
end
