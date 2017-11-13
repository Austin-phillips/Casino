# Game ideas: Wheel of Fortune, Slot Machine, Hi/low,

require 'pry'

require 'colorize'
require_relative 'Player'

class Casino
  attr_accessor

  def initialize 
    puts "Welcome to the ruby casino"
    @player = Player.new

  end
end

Casino.new