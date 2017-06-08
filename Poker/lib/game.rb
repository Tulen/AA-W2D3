require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :deck
  def initialize(player_names, funds)
    @players = player_names
    @starting_fund = funds
    @deck = Deck.new
    @pot = 0
    @active_players
    @bet_positon
    @current_bet = 0
  end

  def setup
    @players.map! {|name| player_setup(name)}
    @active_players = @players.dup
  end

  def player_setup(name)
    cards_dealt = @deck.deck_list.pop(5)
    Player.new(cards_dealt, name, @starting_fund)
  end

  def play
    round until game_over?
  end

  def round
    until round_over?
      until @bet_position == 0
        @bet_position = 0
        @active_players.each_index do |i|
          turn(i)
          p "#{@current_bet} is the current bet."
        end
        @active_players.rotate(@bet_position)
      end
    end
  end

  def turn(idx)
    player_bet = @active_players[idx].bet
    case player_bet
    when 0 # check / call
      0
    when -1 #fold
      @active_players.delete(@active_players[idx])
    else # raise
      @bet_position = idx
      @current_bet += player_bet
    end

  end

  def round_over?
    false
  end

  def game_over?
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  x = Game.new(['Spencer', 'Justin', 'Bob'], 5000)
  x.setup
  x.play
end
