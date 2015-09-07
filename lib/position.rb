class Position
  attr_reader :x
  attr_reader :y

  TABLE = [[0,0],[0,1],[0,2],[0,3],[0,4],
           [1,0],[1,1],[1,2],[1,3],[1,4],
           [2,0],[2,1],[2,2],[2,3],[2,4],
           [3,0],[3,1],[3,2],[3,3],[3,4],
           [4,0],[4,1],[4,2],[4,3],[4,4]]

  def initialize(x,y)
    @x = x.to_i
    @y = y.to_i
  end

  def is_on_table?
    return TABLE.include?([@x,@y])
  end

  def ==(other)
    return false if other == nil
    return other.x == @x && other.y == @y
  end

  ORIGIN = Position.new(0, 0)
end
