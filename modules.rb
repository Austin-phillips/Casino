require 'colorize'


module Styles

  def self.win(str)
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".green
    puts "#{'$'.ljust(10)} #{str.ljust(25)} $".cyan
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".green
  end

  def self.lose(str)
    puts "--------------------------------------".red
    puts "#{'$'.ljust(10)} #{str.ljust(25)} $".yellow
    puts "--------------------------------------".red
  end

  def self.error(str, symb)
    puts symb.red * 6 + "#{str}" + symb.red * 6
  end
end
