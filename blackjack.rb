require_relative 'deck'
require_relative 'player'
require 'colorize'

class Blackjack
  def initialize(player, casino)
    @casino = casino
    @player = player
    @bet = initial_bet
    @house_hand = []
    @player_hand = []
    @min = 0
    @max = 0
    init_deck
    greeting
    back_casino
  end

  def

  def greeting
    puts "========================================="
    puts "|   welcome to blackjack #{@player.name}      |"
    puts "========================================="
    min_max
  end

  def init_deck
    @d = Deck.new
    @d.shuffle_cards
    binding.pry
  end

  def min_max
    @table = ["[1]  Min: 5  Max: 100", "Min: 50  Max: 500", "Min: 100  Max: 1000", "Back to Casino"]
    puts "What table would you like to enter?"
    @table.each_with_index {|table, i| puts "[#{i}] #{table}"}
    table = gets.to_i
    case table
      when 1
        @min = 5
        @max = 100
      when 2
        @min = 50
        @max = 500
      when 3
        @min = 100
        @max = 1000
      when 4
        @casino.menu
      else
        puts "Enter valid option"
        min_max
    end
  end

  def initial_bet
    #ask the player how much they want to bet
    "How much would you like to bet?   Min: #{@min.light_blue}   Max: #{@max.red}"
    bet = gets.to_i
    if (@min..@max).include?(add_item)
      #good to go to next step
    else
      puts "Must place bet within High/low limits of the table"
    end
  end

  def deal_hand
    #cards get delt to player and house

    #cards must be subtract from the cards array
    #player can see both their cards
    #player can see only 1 of house cards
    #grab the card sum from the hand
  end

  def sum_hand
    #write function to calculate the sum of the players/ house hand
  end

  def dealer_action
    # write some AI for the dealer
    # should be called on each round
    #if total == 17 -- must stand

  end


  def player_action
    #prompt player for actions
    #stand
      #go to next round
    #hit
      #deal another card to player

  end

  def bust
    #if hand total > 21 CONST
    #you bust
    #return to replay
  end

  def replay
    #would you like to play again?
    #case statement
  end

end
casino = "bar"
player = Player.new
Blackjack.new(player, casino)
