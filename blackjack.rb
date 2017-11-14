require_relative 'deck'


class Blackjack

  def initialize(player, casino)
    @casino = casino
    @player = player
    @bet = 0
    @house_hand = []
    @player_hand = []
    @min = 0
    @max = 0
    @player_stand = false
    greet
  end

  def init_deck
    @d = Deck.new
    @d.shuffle_cards
  end

  def greet
    puts "=========================================".yellow
    puts "|   welcome to blackjack #{@player.name.ljust(15)}|".yellow.on_blue
    puts "=========================================".yellow
    init_deck
    min_max
  end

  def min_max
    @table = ["Min: 5  Max: 100", "Min: 50  Max: 1000", "Min: 1000  Max: 10000", "Back to Casino"]
    puts "What table would you like to enter?"
    @table.each_with_index {|table, i| puts "[#{(i + 1).to_s.light_blue}] #{table}"}
    table = gets.to_i
    case table
      when 1
        @min = 5
        @max = 100
        initial_bet
      when 2
        @min = 50
        @max = 1000
        initial_bet
      when 3
        @min = 1000
        @max = 10000
        initial_bet
      when 4
        @casino.menu
      else
        puts "Enter valid option"
        start
    end
  end

  def initial_bet
    #ask the player how much they want to bet
    puts "How much would you like to bet?   Min: #{@min.to_s.light_blue}   Max: #{@max.to_s.red}"
    bet = gets.to_i
    if (@min..@max).include?(bet)
      if @bet > @player.waller.amount
        puts "Come back wen you have some real cash!"
        min_max
      else
        @bet = bet
        start
      end
    else
      puts "Must place bet within High/low limits of the table"
      initial_bet
    end
  end


  def start
    deal_player unless @player_stand
    deal_house if test_hand(@dealer_hand) <= 17
    #win condition
    you_win if test_hand(@dealer_hand) > 18 &&  @player_stand

    hit unless @player_stay
  end

  def deal_player
    @player_hand << @d.deal(1)
    puts "#{@player.name} has.."
    @player_hand.each { |card| puts "  #{card.name}" }
    if test_hand(@player_hand) > 21
      puts "You busted."
      loser
    end
  end

  def deal_house
    @house_hand << @d.deal(1)
    puts "Dealer has.."
    @house_hand.each { |card| puts "  #{card.name}" }
    if test_hand(@house_hand) > 21
      puts "The dealer Bust!"
      winner
    end
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

  def test_hand(hand)
    return 0 if hand == nil
    ranks = []
    hand.each { |card| ranks << card.rank }
    ranks.map! do |rank|
      if rank =~ /J|Q|K/
        10
      elsif rank == "A"
        11
      else
        rank.to_i
      end
    end
    total = ranks.reduce(&:+)
    while total > 21 && ranks.include?(11)
      ranks[ranks.index(11)] = 1
      total = ranks.reduce(&:+)
    end
    total
  end

  def you_win
    player = test_hand(@player_hand)
    house = test_hand(@dealer_hand)
    puts "#{@player.name} total:  #{player}."
    puts "House total: #{house}."
    winner if player > house
    loser
  end

  def hit
    puts "What would you like to do?"
    puts "[1] Hit"
    puts "[2] Stand"
    action = gets.to_i
    case action
      when 1
        start
      when 2
        @player_stand = true
        start
      else
        puts "Enter valid input"
        hit
    end
  end

  def replay
    puts "Would you like to play again?"
    puts "[1] Yes"
    puts "[2] No"
    input = gets.to_i
    case input
    when 1
      new
    when 2
      @casino.menu
    else
      puts "please enter valid input"
    end
    replay
  end

  def winner
    puts "You win!"
    puts `say winner winner chicken dinner`
    puts "#{@bet}$ has been added to your wallet!".green
    puts "You have #{@player.wallet.amount}$ remaining"
    @player.wallet.add(@bet)
    replay
  end

  def loser
    puts "You lose!"
    puts `say wom wom`
    puts "#{@bet}$ has been removed from your wallet".red
    puts "You have #{@player.wallet.amount}$ remaining"
    @player.wallet.subtract(@bet)

    replay
  end

  def new
    @house_hand.clear
    @player_hand.clear
    @player_stand = false
    greet
  end

end
