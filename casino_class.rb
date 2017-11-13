# Game ideas: Wheel of Fortune, Slot Machine, Hi/low,

require 'pry'
require_relative 'player'
require_relative 'wallet'
require_relative 'High / Low'
require 'colorize'
require_relative 'Player'

class Casino

  @options = ["High / Low", "Blackjack", "Exit"]
  attr_accessor player:

  def initialize
    puts "Welcome to the ruby casino"
    @player = player.new
   menu

  end

  def menu
    @options.each_with_index {|opt, i| puts "#{i + 1}) #{opt}" }
    choice = gits.to_i - 1
    case choice
      when 0
        HighLow.new(@player, self)
      when 1
        Blackjack.new(@player, self)
      when 2
        puts "Come again!"
        Exit
      else
        puts "Invalid Choice"
        menu
  end
end

Casino
