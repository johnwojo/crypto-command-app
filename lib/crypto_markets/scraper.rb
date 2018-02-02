require_relative ('environment.rb')
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_reader :page

  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
  end

  def scrape_page
    html = open('https://coinmarketcap.com/')
    doc = Nokogiri::HTML(html)
    coins = doc.css("a.currency-name-container")[0].text
    puts coins
  end

  def self.name
    @name
  end
end
