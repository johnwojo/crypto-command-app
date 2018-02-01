require_relative ('environment.rb')
require 'nokogiri'
require 'open-uri'



class Scraper
  attr_reader :page


  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
  end


  def list(range)
    @page
  end


  def self.scrape_page
    html = open('https://coinmarketcap.com/')
    doc = Nokogiri::HTML(html)
    coins = doc.css("div.text-center sorting_1")
  end


  def self.name
    @name
  end
end
