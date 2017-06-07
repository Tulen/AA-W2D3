require 'rspec'
require 'Hanoi'

describe TowersofHanoi do
  subject(:game) {TowersofHanoi.new}
  describe "#initialize" do
    it "creates towers as array of arrays" do
      expect(game.towers.all? {|arr| arr.is_a?(Array)}).to eq(true)
    end

    it "initializes first tower as array with three discs" do
      expect(game.towers[0].length).to eq(3)
    end

    it "initializes discs as integer values 3,2,1" do
      expect(game.towers[0]).to eq([3,2,1])
    end

    it "initalizes other towers as empty arrays" do
      expect(game.towers[1..2]).to eq([[], []])
    end
  end

  describe "#move" do
    it "only moves from array with discs" do
      expect(game.move(1,2)).to eq('Invalid Move')

    end

    it "only moves onto empty towers or towers with larger discs" do
      game.move(0,1)
      expect(game.move(0,1)).to eq('Invalid Move')
    end

    it "source tower removes disc, target tower gains discs" do
      game.move(0,1)
      expect(game.towers[0].length).to eq(2)
      expect(game.towers[1].length).to eq(1)
    end
  end

  describe "#won?" do
    it "returns false if if towers 2 or 3 are not complete" do
      game.move(0,1)
      expect(game.towers[1]).not_to eq([3,2,1])
      expect(game.towers[2]).not_to eq([3,2,1])
    end

    it "returns true if towers 2 or 3 are complete" do
      game.towers = [[],[3,2,1],[]]
      expect(game.towers[1]).to eq([3,2,1])
      game.towers = [[], [], [3,2,1]]
      expect(game.towers[2]).to eq([3,2,1])
    end
  end

  describe "#play" do

  end
end
