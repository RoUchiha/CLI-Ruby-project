require 'open-uri'
require 'nokogiri'
require 'addressable/uri'
require 'json'
require 'pry'
    

class CLI 

    attr_accessor :forecast
    
    def initialize(location)
       
        @forecast = Weather.new(location)
    
        pick_day(@forecast) 
    end
    
    def new_location
        puts "Would you like to check another zip code? Y/N"
        yes_no = gets.chomp
        if yes_no == "Y" || yes_no == "y"
            puts "What zip code would you like the 5 day weather forecast for?"
            new_zip = gets.chomp.to_i
            CLI.new(new_zip)
        elsif yes_no == "N" || yes_no == "n" || yes_no == "exit" || yes_no == "EXIT"
            exit
        else 
            new_location
        end
    end
    
    def pick_day(forecast)
        puts "Enter the number for the day that you want the weather for:"
       
        puts "1. #{(Date.today).strftime('%m/%d/%Y')}"
        puts "2. #{(Date.today + 1).strftime('%m/%d/%Y')}"
        puts "3. #{(Date.today + 2).strftime('%m/%d/%Y')}"
        puts "4. #{(Date.today + 3).strftime('%m/%d/%Y')}"
        puts "5. #{(Date.today + 4).strftime('%m/%d/%Y')}"
    
        weather_day = gets.chomp.to_i
    
        if weather_day.is_a?(Integer) == true
            puts "High: #{forecast.send("day#{weather_day}")[:high]}"
            puts "Low: #{forecast.send("day#{weather_day}")[:low]}"
            puts "Rain: #{forecast.send("day#{weather_day}")[:rain]}"
        else 
            pick_day(@forecast)
        end
    
        pick_again(@forecast)
    end
    
    def pick_again(forecast)
        puts "Would you like to check another day's weather? Y/N"
        recheck = gets.chomp
        if recheck == "Y" || recheck == "y"
            pick_day(@forecast)
        elsif recheck == "N" || recheck == "n"
            new_location
        end
    end


end