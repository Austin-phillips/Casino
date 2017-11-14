require 'pry'
require 'colorize'

require_relative 'wallet'
require_relative 'player'

class Slots
 #attr_accessor :index, :name, :price, :calories
  def initialize(player, casino)
    @player = player
    @casino = casino


    @slot_images = [
      @orange = "\u{1F34a}",
      @lemon = "\u{1F34b}",
      @bannana = "\u{1F34c}"]

    @spin_result = []

    @spin_result << result_1 = @slot_images.sample
    @spin_result << result_2 = @slot_images.sample
    @spin_result << result_3 = @slot_images.sample

    puts '@@@*************************************@@@'.colorize(:magenta)
    puts " Welcome to Emmy's Ruby Slot Machine #{@player.name}".colorize(:magenta)
    puts "You have #{@player.wallet.amount} to bet with!"
    puts "To quit"



    for x in @spin_result
      print "| #{x} |" + "\t"; sleep(0.8)
    end

    puts "\n"

    if result_1 == result_2 && result_2 == result_3
      win = 1
      puts "\tJACKPOT!!!\tJACKPOT!!!\tJACKPOT!!!".colorize(:cyan).on_blue
      puts "\t\tYou have 3 matching symbols!!!".colorize(:magenta)
      puts "\n"
      puts "\t\tJACKPOT win is 2.5 times your bet!"
    elsif result_1 == result_2 || result_2 == result_3
      win = 2
      puts "\t\tYou have 2 matching symbols!!!".colorize(:magenta)
      puts "\t\tYou have won 2nd prize!".colorize(:cyan)
      end

  end

    # print @spin_result all on one line

  def menu
      puts '@@@*************************************@@@'.colorize(:magenta)
      puts " Welcome to Emmy's Ruby Slot Machine #{player.name}".colorize(:magenta)
      puts "You have #{player.wallet.amount} to bet with!"

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
