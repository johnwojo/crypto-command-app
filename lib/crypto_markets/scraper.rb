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


  def self.scrape_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    coin_list = []
    puts doc
    #puts doc.css('.text-center sorting_1')
  end


  def self.name
    @name
  end
end
