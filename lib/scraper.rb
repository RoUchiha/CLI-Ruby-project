require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'


require_relative './search.rb'

class Scraper

    attr_accessor :location, :outlook

    def initialize(location)
        scrape_rain(location)
    end

    def scrape_rain(zip)
        @outlook = []
        link = Search.new(zip).zip_url
        html = URI.open(link)
        weather = Nokogiri::HTML(html)
        weather.css('.DailyWeatherCard--TableWrapper--3mjsg').css('.WeatherTable--columns--OWgEl li.Column--column--1p659').each do |w|
            i = 0
            if w.css('.Column--temp--5hqI_')[i].text == "--"
                @outlook << {
                    :high => weather.css('.CurrentConditions--primary--2SVPh .CurrentConditions--tempValue--3a50n').text,
                    :low => w.css('.Column--tempLo--1GNnT')[i].text,
                    :rain => w.css('.Column--precip--2ck8J .Accessibility--visuallyHidden--2uGW3')[i].text
                    }
            else
                @outlook << {
                    :high => w.css('.Column--temp--5hqI_')[i].text,
                    :low => w.css('.Column--tempLo--1GNnT')[i].text,
                    :rain => w.css('.Column--precip--2ck8J .Accessibility--visuallyHidden--2uGW3')[i].text
                    }
            end
            i += 1
        end       
    end 
end