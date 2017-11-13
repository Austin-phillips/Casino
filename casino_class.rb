require 'pry'
require_relative 'player'
require_relative 'wallet'
require_relative 'high_low'
require 'colorize'

class Casino

  attr_accessor :player, :options

  def initialize
    @options = ["HighLow", "Blackjack", "Exit"]
    @player = Player.new
   menu

  end

  def menu
    @options.each_with_index {|opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1
    case choice
      when 0
        HighLow.new(@player)
      when 1
        Blackjack.new(@player, self)
      when 2
        puts "Thanks for playing with us, Come again."
        exit
      else
        puts "Invalid Choice"
        menu
  end
end

end

Casino.new
