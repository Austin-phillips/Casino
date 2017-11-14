require_relative 'deck'
require_relative 'player'
require 'colorize'
require 'pry'


class Blackjack
  BUST = 21

  def initialize(player, casino)
    @casino = casino
    @player = player
    @bet = 0
    @house_hand = []
    @house_total = 0
    @player_hand = []
    @player_total = 0
    @min = 0
    @max = 0
    init_deck
    greet
  end


  def greet
    puts "========================================="
    puts "|   welcome to blackjack #{@player.name}           |"
    puts "========================================="
    min_max
  end

  def init_deck
    @d = Deck.new
    @d.shuffle_cards
  end

  def min_max
    @table = ["Min: 5  Max: 100", "Min: 50  Max: 500", "Min: 100  Max: 1000", "Back to Casino"]
    puts "What table would you like to enter?"
    @table.each_with_index {|table, i| puts "[#{i + 1}] #{table}"}
    table = gets.to_i
    case table
      when 1
        @min = 5
        @max = 100
        initial_bet
      when 2
        @min = 50
        @max = 500
        initial_bet
      when 3
        @min = 100
        @max = 1000
        initial_bet
      when 4
        @casino.menu
      else
        puts "Enter valid option"
        min_max
    end
  end

  def initial_bet
    #ask the player how much they want to bet
    puts "How much would you like to bet?   Min: #{@min.to_s.light_blue}   Max: #{@max.to_s.red}"
    bet = gets.to_i
    if (@min..@max).include?(bet)
      @bet = bet
      deal_hand
    else
      puts "Must place bet within High/low limits of the table"
      initial_bet
    end
  end

  def card_with_color(who)
    who[0].each do |card|
      if card.suit.include?('Diamonds') || card.suit.include?('Hearts')
        print " #{card.name.red} "
      else
        print " #{card.name} "
      end
    end
    puts ""
  end

  def sum_card(who)
    sum = []
    who[0].each do |num|
      if num.rank.include?("J") || num.rank.include?("Q") || num.rank.include?("K")
        sum << 10
      elsif num.rank.include?("A")
        sum << 1
      else
        sum << num.rank.to_i
      end
    end
    sum.reduce(&:+)
  end

  def deal_hand
    @player_hand << @d.cards.shift(2)
    @player_total += sum_card(@player_hand)
    @house_hand << @d.cards.shift(2)
    @house_total += sum_card(@house_hand)
    print "House: "
    card_with_color(@house_hand)
    puts "\n"
    print "#{@player.name}: "
    card_with_color(@player_hand)
    puts "\n"
    player_action
  end

  def action_menu
    puts "Total: #{@player_total}"
    puts "What would you like to do?"
    player_actions = ["Hit", "Stand"]
    player_actions.each_with_index {|action, i| puts "[#{i + 1}] #{action}"}
    card_with_color(@player_hand)
  end

  def player_action
    while @player_total < 21
      action_menu
      choice = gets.to_i
      case choice
        when 1
          hit(@player_hand)
          player_action
        when 2
          dealer_action
        else
          puts "Enter valid action"
      end
    end
    lose
  end

  def dealer_action
    while  @house_total < 17
      puts "House will hit"
      hit(@house_hand)
      puts "House total: #{house_total}"
      if @house_total >= 17
        puts "Dealer will stand"
        compare_hands
      end
    end
  end

  def hit(who, player = 'player')
    card = @d.cards.shift
    who << card
    if player == 'player'
      @player_total += single_card(card)
    else
      @house_total += single_card(card)
    end
    card_with_color(@player_hand)
  end

  def lose
    puts "You lose!"
    replay
  end

  def single_card(card)
    if card.rank.include?("J") || card.rank.include?("Q") || card.rank.include?("K")
      10
    elsif card.rank.include?("A")
      1
    else
      card.rank.to_i
    end
  end


  def totals
    puts "#{@player.name}:  #{sum_hand(@player_hand)}House:  #{sum_hand(@player_hand)}"
  end

  def compare_hands
    if sum_hand(@player_hand) > sum_hand(@house_hand)
      totals
      puts "You Win!!"
      #Add to player wallet
    elsif sum_hand(@player_hand) === sum_hand(@house_hand)
      totals
      puts "A push!"
    else
      totals
      puts "You Lose!"
      # sutract from player wallet
    end
  end

  def replay
    puts "Would you like to play again?"
    puts "[1] Yes"
    puts "[2] No"
    input = gets.strip
    case input
    when 1
      min_max
    when 2
      @casino.menu
    else
      puts "please enter valid input"
    end
  end

end
casino = "bar"
player = Player.new
Blackjack.new(player, casino)
