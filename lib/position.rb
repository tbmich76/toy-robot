class Position
  attr_reader :x
  attr_reader :y
  attr_reader :f

  X_AXIS = [0,1,2,3,4]
  Y_AXIS = [0,1,2,3,4]

  def initialize(x,y)
    @x = x.to_i
    @y = y.to_i
  end

  def is_valid?
    return X_AXIS.include?(@x) && Y_AXIS.include?(@y)
  end

  def ==(other)
    return false if other == nil
    return other.x == @x && other.y == @y
  end
end
