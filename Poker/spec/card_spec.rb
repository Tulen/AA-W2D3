require 'rspec'
require 'card'

describe Card do
  subject(:card) {Card.new(1,:d)}
  describe "#initialize" do
    it 'initializes a value and suit' do
      expect(card.value).to eq(1)
      expect(card.suit).to eq(:d)
    end
  end
end
