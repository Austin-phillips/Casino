require 'pry'
require_relative 'Dice'

class HighLow
  attr_accessor :player, :casino

  def initialize (player)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts " _   _ ___ ____ _   _       _     _____        __".colorize(:green)
    puts "| | | |_ _/ ___| | | |     | |   / _ \\ \\      / /".colorize(:green)
    puts "| |_| || | |  _| |_| |_____| |  | | | \\ \\ /\\ / / ".colorize(:green)
    puts "|  _  || | |_| |  _  |_____| |__| |_| |\\ V  V /  ".colorize(:green)
    puts "|_| |_|___\\____|_| |_|     |_____\\___/  \\_/\\_/   ".colorize(:green)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts "Welcome to High/Low! : #{player.name}".
    puts "You have #{player.wallet.amount} to bet with!"

    d = Dice.new
    d.show_sum
    num1 = sum_of_dice

    puts "How much would you like to bet?"
    bet = gets.strip.to_f
    player.wallet.amount = (player.wallet.amount - bet)

    puts "Will the next roll be higher or lower?"
    choice = gets.strip.downcase
    when "Higher"
      higher = (num1, bet, player)
    
    when "Lower"
      lower = (num1, bet, player)
      else
      puts "I'm sorry, I couldn't hear you."

  def higher(first_roll, bet, player)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 > first_roll
      puts 'You are a Winner!'.colorize(:green)
      winnings = (bet * 2)
    player.wallet.amount = (player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:green)
      puts "Your wallet now has #{player.wallet.amount}".colorize(:green)
    else
      puts 'That sucks. Gimme my money!'.colorize(:red)
      puts "Your walled now has #{player.wallet.amount}".colorize(:red)
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
    player.wallet.amount = (player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:green)
      puts "Your wallet now has #{player.wallet.amount}".colorize(:green)
    else
      puts 'That sucks. Gimme my money!'.colorize(:red)
    end
    sub_menu(player)
  end
  
  def sub_menu(player)
    p '1) GO AGAIN!'
    p '2) Main Menu'
    case gets.strip.to_i
      when 1
        BlackJack.new(player)
      when 2
        RandomAct.new(player)
    end
  end
end
