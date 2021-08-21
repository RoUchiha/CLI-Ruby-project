require 'open-uri'
require 'nokogiri'
require 'addressable/uri'

class Search

    attr_accessor :location

    def initialize(location)
        if location.length != 5
            raise 
    end

    def searcher(zip)
        url = https://www.google.com/search?q=+rain+chances

    end


end