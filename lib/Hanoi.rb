class TowersofHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start, target)
    if @towers[start].empty? ||
       (!@towers[target].empty? &&
      @towers[start].last > @towers[target].last)
      return 'Invalid Move'
    else
      @towers[target] << @towers[start].pop
    end
  end

  def won?
    return true if @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
    false
  end
end
