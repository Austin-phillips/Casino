class Player
  attr_accessor :name, :age

  def initialize
    puts "What is your name?"
    @name = gets.strip
    puts "What is your age?"
    @age = gets.to_i
    age_verification
  end

  def age_verification
    if @age < MIN_AGE
      puts "Get out of here"
      exit
    end
  end

end

Player.new