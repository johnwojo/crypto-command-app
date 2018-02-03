require_relative "environment.rb"
require 'nokogiri'

class Coin
  attr_accessor :name, :market_cap, :price, :daily_volume, :circulating_supply, :daily_change, :rank, :attributes, :profile_page
  @@all = []

  def initialize(name)
    @attributes = {}
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

  def all
    @@all
  end
end
