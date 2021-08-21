require 'open-uri'
require 'nokogiri'

require_relative './scraper.rb'

class Scraper

    attr_accessor :location, :scrape_url

    def initialize(location)
        

        scrape_rain(Search.new(location).zip_url)
    end

    def scrape_rain(link)
        html = URI.open(link)
        weather = Nokogiri::HTML(html)

        weather.css('.wtsRwe wob_pp').text
    end


end

Scraper.new(75007).scrape_url