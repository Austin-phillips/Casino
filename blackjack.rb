class Blackjack
  def initialize(player, casino)
    @casino = casino
    @player = player
    @bet = initial_bet
    puts "You created blackjack"
    greeting(player)
    binding.pry
    back_casino
  end

  def greeting(player)
    puts "========================================="
    puts "|   welcome to blackjack #{player.name}      |"
    puts "========================================="

    puts "You are in blackjack and you lost".red
    lame = gets.strip
    binding.pry
    @player.money.change_wallet(500, 'lose')
  end

  def back_casino
    @casino.enter_game
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
      @min = 5
      @max = 100
    when 3
      @min = 5
      @max = 100
    when 4
      #method to return to casino      
  end

  def initial_bet
    #ask the player how much they want to bet
    #
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
