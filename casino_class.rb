# Game ideas: Wheel of Fortune, Slot Machine, Hi/low,

require 'pry'

class Casino
  def initialize 
    puts "Welcome to the ruby casino"
    puts "What is your name player?"
    name = gets.strip
  end
end

Casino.new