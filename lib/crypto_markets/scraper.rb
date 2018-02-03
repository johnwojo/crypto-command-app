require_relative ('environment.rb')

class Scraper
  attr_reader :page
  attr_accessor :coin_list

  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    @coin_list = []
    self.scrape_page_for_coins
    self.market_cap_assignment
    self.price_assignment
    self.daily_volume_assignment
    self.circulating_supply_assignment
    self.daily_change_assignment
  end

  def scrape_page_for_coins
    coin_array = []
    @page.css("a.currency-name-container").each {|coin| coin_array << coin.text}
    coin_array.each_with_index do |crypto,index| crypto = Coin.new("#{crypto}")
      crypto.rank = index.to_i + 1
      @coin_list << crypto
    end
  end


  #def scrape_profile_page
    # activate this method.. scrape only the profile page of this particular coin for the new data.
    #doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    #market_cap = doc.css(".no-wrap.market-cap.text-right")[0].text
    #puts market_cap
  #end


  def market_cap_assignment
    array = []
    doc = @page.css("td.no-wrap.market-cap.text-right")
    doc.each {|market| array << market.text.strip}
    counter = 0
    until counter == 100
      coin_list[counter].market_cap = array[counter]
      counter +=1
    end
  end


  def price_assignment
    array = []
    doc = @page.css("a.price")
    doc.each {|price| array << price.text.strip}
    @coin_list.each do |coin| array.each do |price|
      coin.price = price
      end
    end
  end

  def daily_volume_assignment
    array = []
    doc = @page.css("td.no-wrap.market-cap.text-right")
    doc.each {|volume| array << volume.text.strip}
    @coin_list.each do |coin| array.each do |volume|
      coin.daily_volume = volume
      end
    end
  end


  def circulating_supply_assignment
    array = []
    doc = @page.css("td.no-wrap.market-cap.text-right")
    doc.each {|supply| array << supply.text.strip}
    @coin_list.each do |coin| array.each do |supply|
      coin.circulating_supply = supply
      end
    end
  end

  def daily_change_assignment
    array = []
    doc = @page.css("td.no-wrap.market-cap.text-right")
    doc.each {|change| array << change.text.strip}
    @coin_list.each do |coin| array.each do |change|
      coin.daily_change = change
      end
    end
  end
end
