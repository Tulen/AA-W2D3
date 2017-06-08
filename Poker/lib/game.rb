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
    @last_bettor
    @current_bet = 0
    @over = false
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
    round
    # round until game_over?
  end

  def round
    until @over == true
      until @last_bettor == 0
        @last_bettor = 0
        @active_players.each_index do |i|
          get_bets(i)
          p "#{@current_bet} is the current bet."
        end
        # Fix Betting Turn Reset
        @active_players.rotate(@last_bettor)
      end
      p @active_players.first.hand
      get_swaps
      p @active_players.first.hand

      @last_bettor = nil
      until @last_bettor == 0
        @last_bettor = 0
        @active_players.each_index do |i|
          get_bets(i)
          p "#{@current_bet} is the current bet."
        end
        @active_players.rotate(@last_bettor)
      end
      @over = true
    end
  end

  def get_bets(idx)
    player_bet = @active_players[idx].bet
    case player_bet
    when 0 # check / call
      0
    when -1 #FIX FOLDING LOGIC
      @active_players.delete(@active_players[idx])
    else # raise
      @last_bettor = idx
      @current_bet += player_bet
    end
  end

  def get_swaps
    @active_players.each do |player|
      player.render_hand
      hand_swap(player, player.swap)
      # player.render_hand
    end
  end

  def hand_swap(player, to_swap)
    to_swap.each do |idx|
      player.hand.delete(player.hand[idx])
    end
    until player.hand.length == 5
      player.hand.push(@deck.deck_list.pop)
    end
  end

  def round_over?
    # @over = false
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
