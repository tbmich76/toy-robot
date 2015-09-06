class RobotState
  attr_reader :orientation, :position, :is_placed

  BEARINGS = ["NORTH","EAST","SOUTH","WEST"]

  def initialize
    @is_placed = false
  end

  def place(x,y,f)
    orientation = f.to_s.upcase
    position = Position.new(x, y)
    return unless BEARINGS.include?(orientation)
    return unless position.is_valid?
    @is_placed = true
    @orientation = orientation
    @position = position
  end

  def move
  end
end
