require_relative "environment.rb"
require 'nokogiri'


class CommandLineInterface
  def run
      welcome
      request
      more_info
      goodbye
    end

    def welcome
      puts "Hello! Welcome to the CoinMarketCap scraper. Here you will learn about the top 100 Cryptocurrencies currently in circulation."
      puts "Which list would you like to see? For 1-10, enter 1."
      puts "For 11-20, enter 11. For 21-30, enter 21. Etc."
      puts "Otherwise, just type 'Exit.'"
    end

    def request
      input = gets.strip
      if input.to_i > 0 && input.to_i < 101
        puts "Here are coins #{input.to_i} - #{input.to_i+9}."
        get_list
      elsif input.downcase != "exit"
        puts "Invalid input. Try again. Enter 1,11,21,31,etc.."
      end
    end

    def get_list
      puts "1. Bitcoin."
      puts "2. Ethereum."
    end

    def more_info
      input = nil
      until input == "exit"
        puts "Which coin do you want to know more about? 1-100. Or type exit to exit!"
        input = gets.strip
        if input.to_i > 0 && input.to_i < 101
          puts "Here's more info about coin #{input}."
          coin_list = Scraper.new
          coin_list.list(input)
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
