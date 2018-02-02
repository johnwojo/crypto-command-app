require_relative "environment.rb"
require 'nokogiri'


class CommandLineInterface
attr_reader :scraper

  def initialize
    @scraper = Scraper.new
  end

  def run
      puts "Hello! Welcome to the CoinMarketCap scraper. Here you will learn about the top 100 Cryptocurrencies currently in circulation."
      initial_request
  end

  def initial_request
    puts "Which list would you like to see? For 1-10, enter 1."
    puts "For 11-20, enter 11. For 21-30, enter 21. Etc."
    puts "Otherwise, just type 'Exit.'"
    get_list
    secondary_request
  end

  def secondary_request
    puts "Would you like to see another list? If so, type 'list' and press enter."
    puts "Otherwise, type 'info' for more info on a specific coin."
    puts "Or type 'exit' to end the program."
    input = gets.strip
    if input.downcase == "list"
      initial_request
    elsif input.downcase == "info"
      more_info
    elsif input.downcase == "exit"
      goodbye
    elsif input.downcase != "exit"
      puts "Invalid input. Try again. Please enter either list, info, or exit."
    end
  end

  def get_list
    input = gets.strip
    if input.to_i > 0 && input.to_i < 92 && input.downcase != "exit"
      input = input.to_i
      input_range = input + 9
      puts "Here are coins #{input.to_i} - #{input_range}:"
      counter = 1
      puts "#{input}. #{self.scraper.coin_list[input - 1].name}"
      until counter == 10
        puts "#{input+=1}. #{self.scraper.coin_list[input - 1].name}"
        counter += 1
      end
    elsif input.downcase != "exit"
      puts "Invalid input. Try again. Enter 1,11,21,31,etc.."
    end
  end

  def more_info
    input = nil
    until input == "exit"
      puts "Which coin do you want to know more about? 1-100. Or type exit to exit!"
      input = gets.strip
      if input.to_i > 0 && input.to_i < 101
        puts "Here's more info about coin #{input}."
        coin_list = Scraper.new
        coin_list.scrape_page_for_coins
        #^ -- this Scraper isn't functional. There is something wrong with the CSS selector that I'm using.
      else
        puts "Please enter a number 1-100. Or type exit to exit!"
      end
    end
  end

  def goodbye
    puts "Thanks for using the CoinMarketCap scraper. Have a cryptoriffic day."
    puts "Don't forget to HODL!"
  end
end
