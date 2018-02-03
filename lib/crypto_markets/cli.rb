require_relative "environment.rb"

class CommandLineInterface
attr_reader :scraper
attr_accessor :continue


  def initialize
    @scraper = Scraper.new
    @continue = "yes"
  end

  def run
      puts "Hello! Welcome to the CoinMarketCap scraper. Here you will learn about the top 100 Cryptocurrencies currently in circulation."
      initial_request
      goodbye
  end

  def initial_request
    puts "Which list would you like to see? For 1-10, enter 1."
    puts "For 11-20, enter 11. For 21-30, enter 21. Etc."
    puts "Otherwise, just type 'Exit.'"
    get_list
    if @continue == "yes"
      secondary_request
    end
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
    elsif input.downcase == "exit"
      @continue = "no"
    end
  end

  def more_info
    input = nil
    until input == "exit"
      puts "Which coin do you want to know more about? Enter a number 1-100. Or type exit to exit!"
      input = gets.strip
      if input.to_i > 0 && input.to_i < 101
        input = input.to_i
        puts "Here's more info about #{scraper.coin_list[input-1].name}."
        puts "The profile page of this coin is: #{scraper.coin_list[input-1].profile_page}."
        puts "The Market Cap of this coin is #{scraper.coin_list[input-1].market_cap}."
        puts "The current price of this coin is #{scraper.coin_list[input-1].price}."
        puts "The volume of this coin moved in the last 24 hours is #{scraper.coin_list[input-1].daily_volume}."
        puts "The circulating supply of this coin is #{scraper.coin_list[input-1].circulating_supply}."
        puts "The daily change in price of this coin is #{scraper.coin_list[input-1].daily_change}."
        self.scraper.coin_list.each do |coin|
          if coin.rank == input
            #puts coin.name
            #self.scraper.scrape_profile_page
          end
        end
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
