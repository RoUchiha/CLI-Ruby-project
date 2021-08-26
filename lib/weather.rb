require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'


require_relative './scraper.rb'


class Weather

    attr_accessor :location, :day1, :day2, :day3, :day4, :day5

    def initialize(location)
        chances = Scraper.new(location).outlook
        @day1 = chances[0]
        @day2 = chances[1]
        @day3 = chances[2]
        @day4 = chances[3]
        @day5 = chances[4]
    end
end

