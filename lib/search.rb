require 'open-uri'
require 'nokogiri'
require 'addressable/uri'

class Search

    attr_accessor :location, :zip_url

    def initialize(location)
        if location < 00501 || location > 99950
            raise ArgumentError
        else
            searcher(location)
        end
    end

    def searcher(zip)
        uri = Addressable::URI.parse('https://www.google.com/search?q=+rain+chances')
        p = uri.query_values
        uri.query_values = p.merge('loc' => zip)
        @zip_url = uri.to_s
    end
end

Search.new(75007).zip_url