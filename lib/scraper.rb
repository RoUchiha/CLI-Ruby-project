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
        uri = Addressable::URI.parse('https://www.google.com/search?q=+rain+chances')
        p = uri.query_values
        uri.query_values = p.merge('loc' => zip)
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

        @scrape_url = weather.css('.wtsRwe span.wob_pp').text
        return @scrape_url
    end


end

Scraper.new(75007)