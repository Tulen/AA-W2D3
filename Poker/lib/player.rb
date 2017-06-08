require_relative 'hand'

class Player
  attr_reader :hand

  def initialize(hand, name = nil, funds = 0)
    @hand = hand
    @name = name
    @funds = funds
  end

  # def player_turn
  #   bet
  # end

  def render_hand
    p hand.map {|card| [card.value, card.suit]}
  end

  def swap
    puts "#{@name}, which cards would you like to swap? (1,2,5)"
    to_swap = gets.chomp
    to_swap.split(',').map(&:to_i)
  end

  def fold
    :fold
  end

  def bet
    puts "#{@name}, what would you like to do? (check/call or raise or fold)? "
    decision = gets.chomp
    case decision
    when 'raise'
      puts 'How much would you like to raise?'
      raised_value = gets.chomp.to_i
      return raised_value
    when 'check', 'call'
      return 0
    when 'fold'
      return -1
    end
  end
end
