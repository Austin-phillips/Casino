require 'pry'
require_relative 'player'
require_relative 'wallet'
require_relative 'high_low'
require_relative 'spin_the_wheel'
require 'colorize'

class Casino

  attr_accessor :player, :options

  def initialize
    @options = ["HighLow", "Blackjack", "Exit"]
    @player = Player.new
   menu

  end

  def menu
    puts "Which game would you like to play?"
    @options.each_with_index {|opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1
    case choice
      when 0
        HighLow.new(@player)
      when 1
        Blackjack.new(@player, self)
      when 2
        WheelFortune.new(player, self)
      when 3
        puts "Thanks for playing with us, please come again"
        exit
      else
        puts "Invalid Choice"
        menu
      end
  end
end



Casino.new
