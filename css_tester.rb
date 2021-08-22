require 'open-uri'
require 'nokogiri'
require 'addressable/uri'

html = URI.open()
link = Nokogiri::HTML(html)
