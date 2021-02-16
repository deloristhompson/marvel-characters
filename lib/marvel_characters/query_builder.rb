# frozen_string_literal: true

require 'pry'
module MarvelCharacters
  class QueryBuilder
    attr_reader :authorize

    def self.all(end_point)
      authorize
      uri = "#{MARVEL_END_POINT}#{end_point}?ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.query_builder(end_point, params)
      authorize
      url = ''

      params.each do |key, value|
        url += "#{key}=#{value}&"
      end

      uri = "#{MARVEL_END_POINT}#{end_point}?#{url}ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.find(end_point, id)
      authorize
      uri = "#{MARVEL_END_POINT}#{end_point}/#{id}?ts=#{@auth[:ts]}&apikey=#{MARVEL_PUBLIC_KEY}&hash=#{@auth[:md5]}"

      res = HTTP.get(uri)
      res.parse
    end

    def self.authorize
      ts = Time.now.to_i
      md5 = Digest::MD5.new
      md5.update(ts.to_s + MARVEL_PRIVATE_KEY + MARVEL_PUBLIC_KEY)
      @auth = { ts: ts, md5: md5 }
    end
  end
end
