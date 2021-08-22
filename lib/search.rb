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
        uri = Addressable::URI.parse('https://weather.com/weather/today/l/' + zip.to_s)        
        @zip_url = uri.to_s
    end
end
