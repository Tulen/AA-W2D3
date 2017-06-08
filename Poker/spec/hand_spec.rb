require 'rspec'
require 'hand'
require 'card'

describe Hand do
  subject(:hand) {Hand.new(Array.new(5) {Card.new(2, :d)}) }
  describe '#initialize' do


    it "initialize hand with five cards" do
      expect(hand.cards.length).to eq(5)
      expect(hand.cards.all?{|card| card.is_a?(Card)}).to eq(true)
    end

    it "contains a hand score" do
      expect(hand.score).not_to eq(nil)
    end

  end

  describe '#score' do
    it 'calculates and updates score' do
      expect(hand.score).to eq(2)
    end
  end

end
