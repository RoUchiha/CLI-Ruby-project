require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'


require_relative './search.rb'

class Scraper

    attr_accessor :location, :scrape_url

    def initialize(location)
        scrape_rain(location)
    end

    def scrape_rain(zip)
        link = Search.new(zip).zip_url
        html = URI.open(link)
        weather = Nokogiri::HTML(html)
        if weather.css('.CurrentConditions--precipValue--3nxCj').text != ""
            @scrape_url = weather.css('.CurrentConditions--precipValue--3nxCj').text
        elsif weather.css('.CurrentConditions--precipValue--3nxCj').text == "" && !weather.css('.CurrentConditions--phraseValue--2Z18W').text.include?("Rain")
            @scrape_url = "0% chance of rain"
        else
            @scrape_url = "expect #{weather.css('.CurrentConditions--phraseValue--2Z18W').text}"
        end
        return @scrape_url
    end
end