require 'pry'
require_relative 'wallet'

class Player
  MIN_AGE = 21
  attr_accessor :name, :age, :wallet

  def initialize
    puts "What is your name?" .cyan
    @name = gets.strip
    @name = name
    puts "What is your age?" .cyan
    @age = gets.to_i
    age_verification
    puts "How much money are you playing with?" .green
    amount = gets.to_f
    @wallet = Wallet.new(amount)
  end

  def age_verification
    if @age < MIN_AGE
      puts "Get out of here"
      exit
    end
  end

end
