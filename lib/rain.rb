require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'


require_relative './search.rb'

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

class Scraper

    attr_accessor :location, :scrape_url

    def initialize(location)
        scrape_rain(location)
    end

    def scrape_rain(zip)
        link = Search.new(zip).zip_url
        html = URI.open(link)
        weather = Nokogiri::HTML(html)

        scrape = weather.css('.CurrentConditions--precipValue--3nxCj').text.strip
        @scrape_url = scrape
        return @scrape_url
    end
end

class Rain 

    attr_accessor :location

    def initialize(location)
        chances = Scraper.new(location).scrape_url
        puts "This location has a #{chances}."
    end

end

