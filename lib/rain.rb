class Rain 

    attr_accessor :location

    def initialize(location)
        chances = Scraper.new(location).scrape_url
        puts "The rain chances for the given location are #{chances}."
    end

end