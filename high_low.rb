class HighLow
  attr_accessor :player, :casino

  def initialize (player)
    @player = player
    puts "Do you want to play High Low: #{player.name}"
      Casino.menu
      end
    end
  end