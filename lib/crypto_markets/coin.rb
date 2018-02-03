require_relative "environment.rb"

class Coin
  attr_accessor :name, :market_cap, :price, :daily_volume, :circulating_supply, :daily_change, :rank, :profile_page

  def initialize(name)
    @name = name
    @market_cap = market_cap
    @price = price
    @daily_volume = daily_volume
    @circulating_supply = circulating_supply
    @daily_change = daily_change
    @rank = rank
    @profile_page = "https://www.coinmarketcap.com/currencies/" + "#{self.name}"
  end
end
