require_relative 'player'
require_relative 'CardReference'

class Hand
  include CardReference

  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
    @score
  end

  def score
    high_card = 0
    @cards.each do |card|
      high_card = card.value if card.value > high_card
    end
    @score = high_card
  end
end
