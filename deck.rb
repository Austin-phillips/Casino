require_relative 'card'
require 'colorize'

class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
   @suits = %w(Spades Diamonds Clubs Hearts)
   @cards = []
   generate_deck
 end

 def shuffle_cards
  @cards.shuffle!
 end

 def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       # Ternary Operator
       color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'.red
       @cards << Card.new(@ranks[i], suit, color)
     end
   end
 end


end


# d = Deck.new
# d.shuffle_cards
# d.cards.each do |card|
#   # binding.pry
#   if card.suit.include?('Diamonds') || card.suit.include?('Hearts')
#     puts card.name.red
#   else
#     puts card.name
#   end
#
# end
