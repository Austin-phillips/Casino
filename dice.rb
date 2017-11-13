class Dice
  attr_accessor :die1, :die2

 def initialize
   roll
 end

 def roll
   @die1 = 1 + rand(6)
   @die2 = 1 + rand(6)
 end

 def show_dice
   print "Die1: ", @die1, " Die2:", @die2
 end

 def show_sum
   print "Sum of dice is ", @die1 + @die2, ".\n"
 end

 def sum_of_dice
   num = @die1 + @die2
 end
end
