require_relative "environment.rb"
require 'nokogiri'


class CommandLineInterface
attr_reader :scraper

  def initialize
    @scraper = Scraper.new
  end


  def run
      welcome
      initial_request
      secondary_request
      more_info
      goodbye
    end

    def welcome
      puts "Hello! Welcome to the CoinMarketCap scraper. Here you will learn about the top 100 Cryptocurrencies currently in circulation."
      puts "Which list would you like to see? For 1-10, enter 1."
      puts "For 11-20, enter 11. For 21-30, enter 21. Etc."
      puts "Otherwise, just type 'Exit.'"
    end

    def initial_request
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

    def secondary_request
      puts "Would you like to see another list? If so, enter 1 for 1-10, 11 for 11-20, 21 for 21-30, etc."
      puts "Otherwise, enter more info for more info on a specific coin."
      puts "Or enter exit to exit."
      input = gets.strip
      if input.to_i > 0 && input.to_i < 92 && input.downcase != "exit"
        self.initial_request
      elsif input.downcase != "exit"
        puts "Invalid input. Try again. Enter 1,11,21,31,etc.."
        puts "Or type exit to exit"
      end
    end

    def get_list
      coin_list = Scraper.new
      coin_list.scrape_page_for_coins[0]
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



#this is going to end up being a CLI controller. Responsible for user interaction.
