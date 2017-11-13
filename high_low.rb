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
    puts "Do you want to play High Low: #{player.name}"
      end
    end
  
