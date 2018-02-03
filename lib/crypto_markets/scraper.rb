require_relative ('environment.rb')
require 'nokogiri'
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
    coin_array.each_with_index do |crypto,index| crypto = Coin.new("#{crypto}")
      crypto.rank = index.to_i + 1
      @coin_list << crypto
    end
  end


  def scrape_profile_page(page)
    # activate this method.. scrape only the profile page of this particular coin for the new data.
    doc = Nokogiri::HTML(open(page))
    market_cap = doc.css("span.data-currency-value").text
    puts market_cap
  end

  def mass_assignment
    market_array = []
    array = @page.css("td.no-wrap.market-cap.text-right")
    array.each {|market| market_array << market.text.strip}
    @coin_list.each do |coin| market_array.each do |market|
      coin.market_cap = market
    end
  end

  end
end
