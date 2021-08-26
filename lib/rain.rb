require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'


require_relative './scraper.rb'


class Rain 

    attr_accessor :location

    def initialize(location)
        chances = Scraper.new(location).scrape_url
        puts "This location's current rain forecast: #{chances}."
    end
end

