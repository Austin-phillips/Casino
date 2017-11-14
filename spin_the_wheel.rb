require "colorize"
require_relative 'wallet'
require_relative 'player'

class WheelFortune
  attr_accessor :name, :wallet

  def initialize(player, casino)
    @player = player
    @casino = casino
    @numbers = [0,0,0,0,0,0,5,5,5,5,25,25,25,25,75,100,100000]
    puts "===============================================" .red
    puts "|                                             |" .blue
    puts "|                                             |" .yellow
    puts "   Welcome to Spin The Wheel: #{player.name}!" .green
    puts "|                                             |" .yellow
    puts "|                                             |" .blue
    puts "===============================================" .red
    puts "Current balance: $#{@player.wallet.amount}" .green
    puts "$10 to Play" .green
    puts "1) Begin Spin the Wheel" .cyan
    puts "2) Exit back to casino" .red
    option
  end

  def play
    puts "Deducting $10 from wallet" .red
    @player.wallet.subtract(10)
    puts "press ENTER to spin" .cyan
    gets.strip
    print "SPINNING \u{1f300} \u{1f300} \u{1f300}\n" .cyan; sleep(1.8)
    winnings = @numbers.sample
    puts "You won $#{winnings}" .green
    @player.wallet.add(winnings)
    play_2
  end

  def option
    choice = gets.strip.to_i
    case choice
      when 1
        play
      when 2
        @casino.menu
      else
        puts "Invalid response, try again..." .red
    end
    option
  end

  def play_2
    puts "Current balance: $#{@player.wallet.amount}" .green
    puts "1) Spin again" .cyan
    puts "2) Exit back to Casino" .red
    choice_2 = gets.strip.to_i
    case choice_2
      when 1
        play
      when 2
        @casino.menu
    end

  end

end
