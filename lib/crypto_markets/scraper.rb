require_relative ('environment.rb')
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_reader :page
  attr_accessor :coin_list

  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    @coin_list = []
    self.scrape_page_for_coins
  end

  def scrape_page_for_coins
    coin_array = []
    html = open('https://coinmarketcap.com/')
    doc = Nokogiri::HTML(html)
    doc.css("a.currency-name-container").each {|coin| coin_array << coin.text}
    coin_array.each do |crypto| crypto = Coin.new("#{crypto}")
      @coin_list << crypto
    end
    #coin_list.each {|coin| puts coin.name}
  end

  def self.name
    @name
  end
end
