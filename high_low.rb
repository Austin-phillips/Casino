require 'pry'
require 'colorize'
require_relative 'Dice'
require_relative 'Player'

class HighLow
 def initialize(player, casino)
  @player = player 
  @casino = casino
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts " _   _ ___ ____ _   _       _     _____        __".colorize(:green)
    puts "| | | |_ _/ ___| | | |     | |   / _ \\ \\      / /".colorize(:green)
    puts "| |_| || | |  _| |_| |_____| |  | | | \\ \\ /\\ / / ".colorize(:green)
    puts "|  _  || | |_| |  _  |_____| |__| |_| |\\ V  V /  ".colorize(:green)
    puts "|_| |_|___\\____|_| |_|     |_____\\___/  \\_/\\_/   ".colorize(:green)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts "Welcome to High/Low! : #{@player.name}"
    puts "You have #{@player.wallet.amount} to bet with!"

    round
  end


  def round
    d = Dice.new
    d.show_sum
    num1 = d.sum_of_dice
    puts "How much would you like to bet?"
    bet = gets.strip.to_f
    @player.wallet.amount = (@player.wallet.amount - bet)

    puts "Will the next roll be higher or lower?"
    choice = gets.strip.downcase
    
    case choice
      when "higher"
        higher(num1, bet, @player)
      
      when "lower"
        lower(num1, bet, @player)
        else
        puts "I'm sorry, I couldn't hear you."
        choice
    end      
  end 

  def higher(first_roll, bet, player)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 > first_roll
      puts 'You are a Winner!'.colorize(:green)
      winnings = (bet * 2)
    @player.wallet.amount = (@player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:green)
      puts "Your wallet now has #{@player.wallet.amount}".colorize(:green)
    else
      puts 'Apologises, but I do believe you owe me money.'.colorize(:red)
      puts "Your wallet now has #{@player.wallet.amount}".colorize(:red)
    end
    sub_menu(player)

  end

  def lower(first_roll, bet, player)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 < first_roll
      puts 'You are a Winner!'.colorize(:green)
      winnings = (bet * 2)
    @player.wallet.amount = (@player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:green)
      puts "Your wallet now has #{@player.wallet.amount}".colorize(:green)
    else
      puts 'Apologises, but I do believe you owe me money.'.colorize(:red)
    end
    sub_menu(@player)
  end
  
  def sub_menu(player)
    puts '1) GO AGAIN!'
    puts '2) Main Menu'
    case gets.strip.to_i
      when 1
        round
      when 2
        @casino.menu
    end
  end
end

