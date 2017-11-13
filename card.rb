require 'pry'

class Card
 # Getter and Setter methods for rank, suit and color
 attr_accessor :rank, :suit, :color
 # Gets called when you call the new method to create an instance
 # card = Card.new('10', 'K', 'Black')
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
   @suit_symbols = {
     Clubs: "\u2663", Diamonds: "\u2666",
     Hearts: "\u2665", Spades: "\u2660"
   }
 end

 def name
   "#{@rank}#{@suit_symbols[@suit.to_sym]}"
 end

end
