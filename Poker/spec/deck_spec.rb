require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it 'initializes a full deck' do
      expect(deck.deck_list.length).to eq(52)
    end

    describe "#shuffle" do
      it 'shuffles the deck' do
        temp = deck.deck_list.dup
        expect(deck.shuffle!).not_to eq(temp)
      end
    end
  end
end
