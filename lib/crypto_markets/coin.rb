require_relative "environment.rb"

class Coin
  attr_accessor :name, :market_cap, :price, :daily_volume, :circulating_supply, :daily_change, :rank, :profile_page
  @@all = []

  def initialize(name)
    @name = name
    @market_cap = market_cap
    @price = price
    @daily_volume = daily_volume
    @circulating_supply = circulating_supply
    @daily_change = daily_change
    @rank = rank
    @profile_page = "https://www.coinmarketcap.com/currencies/" + "#{self.name}"
    @@all << self
  end

  def self.all
    @@all
  end

  def pretty_all
    printable_array = []
    @@all.each_with_index do |coin,index| printable_array << "#{index.to_i + 1}. #{coin.name}"
    end
    printable_array
  end

end
