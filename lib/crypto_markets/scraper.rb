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
    self.mass_assignment
  end

  def scrape_page_for_coins
    coin_array = []
    @page.css("a.currency-name-container").each {|coin| coin_array << coin.text}
    coin_array.each do |crypto| crypto = Coin.new("#{crypto}")
      @coin_list << crypto
    end
  end

  def mass_assignment
    market_array = []
    array = @page.css("td.no-wrap.market-cap.text-right")
    array.each {|market| market_array << market.text.strip}
  end
end
