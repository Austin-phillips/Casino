require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'
require_relative 'spin_the_wheel'
require_relative 'blackjack'
require_relative 'ruby_slots'

class Casino

    attr_accessor :player, :options

    def initialize
        @options = ["HighLow", "Blackjack","Spin The Wheel", "Slots", "Exit"]

        puts "===============================================".yellow
        puts "|      ~                                 ~    |".yellow
        puts "|       Welcome to the DevCalibur Casino      |".light_blue
        puts "|      ~                                 ~    |".yellow
        puts "===============================================".yellow
        puts `say Welcome to DevCalibur casino`
        @player = Player.new

        menu
    end

    def menu
        puts "Which game would you like to play?"
        @options.each_with_index {|opt, i| puts "#{i + 1}) #{opt}" }
        choice = gets.to_i - 1
        case choice
            when 0
            HighLow.new(@player, self)
            when 1
            Blackjack.new(@player, self)
            when 2
            WheelFortune.new(player, self)
            when 3
            Slots.new(@player, self)
            when 4
            puts "Thanks for playing with us, please come again"
            exit
            else
            puts "Invalid Choice"
            menu
        end
    end
end



Casino.new
