require 'pry'
require_relative 'player'
require_relative 'wallet'
require_relative 'high_low'
<<<<<<< HEAD
=======
require_relative 'spin_the_wheel'
>>>>>>> fix conflicts
require 'colorize'

class Casino

  attr_accessor :player, :options

<<<<<<< HEAD
  def initialize
    @options = ["HighLow", "Blackjack", "Exit"]
    @player = Player.new
   menu

=======
  def initialize 
    @player = Player.new
    @options = ["High/Low" ,"Spin The Wheel","Exit"]
    menu
>>>>>>> fix conflicts
  end

  def menu
    puts "Which game would you like to play?"
    @options.each_with_index {|opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1
    case choice
      when 0
<<<<<<< HEAD
        HighLow.new(@player)
      when 1
        Blackjack.new(@player, self)
      when 2
        puts "Thanks for playing with us, Come again."
=======
        HighLow.new(player, self)
      when 1
        WheelFortune.new(player, self)
      when 2
        puts "Thanks for playing with us, please come again"
>>>>>>> fix conflicts
        exit
      else
        puts "Invalid Choice"
        menu
  end
end

end

Casino.new
