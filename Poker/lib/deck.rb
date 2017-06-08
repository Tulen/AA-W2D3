require_relative 'card'
require_relative 'CardReference'

class Deck
  include CardReference
  attr_reader :deck_list

  def initialize
    @deck_list = []
    populate
    shuffle!
  end

  def populate
    SUITS.each do |suit|
      VALUES.each do |val|
        @deck_list << Card.new(val, suit)
      end
    end
    @deck_list
  end

  def shuffle!
    @deck_list.shuffle!
  end
end
