require 'pry'
require 'colorize'

require_relative 'wallet'
require_relative 'player'

class Slots

  def initialize(player, casino)
    @player = player
    @casino = casino

    @slot_images = [
      @orange = "\u{1F34a}",
      @lemon = "\u{1F34b}",
      @bannana = "\u{1F34c}"]

  end

  def slots_play
    @spin_result = []

    @spin_result << @result_1 = @slot_images.sample
    @spin_result << @result_2 = @slot_images.sample
    @spin_result << @result_3 = @slot_images.sample

    puts '@@@*************************************@@@'.colorize(:magenta)
    puts " Welcome to Emmy's Ruby Slot Machine, #{@player.name}".colorize(:magenta)
    puts " You have #{@player.wallet.amount} to bet with!"
    puts " How much would you like to bet?"
    puts '@@@*************************************@@@'.colorize(:magenta)
    bet = gets.strip.to_f
    @player.wallet.subtract(bet)
    puts "You have #{@player.wallet.amount} remaining."

    for x in @spin_result
      print "\t\t| #{x} |"; sleep(0.8)
    end
    puts
    puts "\n"

    if @result_1 == @result_2 && @result_2 == @result_3
      win = 1
      puts "\tJACKPOT!!!\tJACKPOT!!!\tJACKPOT!!!".colorize(:cyan).on_blue
      puts "\t\tYou have 3 matching symbols!!!".colorize(:magenta)
      puts "\n"
      puts "\t\tJACKPOT win is 2.5 times your bet!"
      winnings = win_calc(win, bet)
      @player.wallet.add(winnings)
      puts "\t\tYou're prize for this spin is #{winnings}".colorize(:red)
      puts "\nYou now have #{@player.wallet.amount}"
    elsif @result_1 == @result_2 || @result_2 == @result_3
      win = 2
      puts "\t\tYou have 2 matching symbols!!!".colorize(:magenta)
      puts "\t\tYou have won 2X the amount you bet!".colorize(:cyan)

      #pass arguments to calc add winnings to wallet
      winnings = win_calc(win, bet)
      @player.wallet.add(winnings)
      puts "\t\tYou're prize for this spin is #{winnings}".colorize(:red)
      puts "\nYou now have #{@player.wallet.amount}"
    end
    replay
  end

  def replay
    puts "Would you like to play again?"
    puts "1) Yes, let's spin again!!"
    puts "2) Exit to Main Casino Meno"
    choice = gets.strip.to_i
    case choice
      when 1
        slots_play
      when 2
        @casino.menu
      else
        puts "Invalid response, try again..." .red
        puts
        replay
    end
    option
  end


  def win_calc(win, bet)
    if win == 1
      bet * 2.5
    elsif win == 2
      bet * 2
    elsif win == 3
      bet * 1.5
    elsif win == 4
      bet * 1.25
    end
  end


end
