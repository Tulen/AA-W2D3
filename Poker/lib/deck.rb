require 'card'

class Deck
  #Update to unicode symbols 
  SUITS = [:d, :c, :h, :s].freeze
  VALUES = (2..14).to_a.freeze

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
