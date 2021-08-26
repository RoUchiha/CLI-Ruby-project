require 'open-uri'
require 'nokogiri'
require 'addressable/uri'

class Search

    attr_accessor :location, :zip_url

    def initialize(location)
        if location < 501 || location > 99950
            raise ArgumentError 
        else
            searcher(location)
        end
    end

    def searcher(zip)
        fixed_zip = zip_convert(zip)
        uri = Addressable::URI.parse('https://weather.com/weather/today/l/' + fixed_zip)        
        @zip_url = uri.to_s
    end

    def zip_convert(code)
        zcode = code.to_s
        while zcode.length < 5 do
            zcode = "0" + zcode
        end
        return zcode
    end

end