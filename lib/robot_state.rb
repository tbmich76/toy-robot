require_relative "cardinal_points"
require_relative "position"

class RobotState
  attr_reader :facing, :position

  def initialize
    @is_placed = false
  end

  def place(position, f)
    orientation = f.to_s.upcase

    return unless CardinalPoints::ALL.include?(orientation)
    return unless position != nil && position.is_on_table?

    @is_placed = true
    @facing = orientation
    @position = position
  end

  def move
    return unless @is_placed

    case @facing
    when CardinalPoints::NORTH
      newPosition = Position.new(@position.x, @position.y+1)
    when CardinalPoints::SOUTH
      newPosition = Position.new(@position.x, @position.y-1)
    when CardinalPoints::WEST
      newPosition = Position.new(@position.x-1, @position.y)
    when CardinalPoints::EAST
      newPosition = Position.new(@position.x+1, @position.y)
    end
    return unless newPosition.is_on_table?
    @position = newPosition
  end

  def left
    return unless @is_placed

    case @facing
    when CardinalPoints::NORTH
      @facing = CardinalPoints::WEST
    when CardinalPoints::WEST
      @facing = CardinalPoints::SOUTH
    when CardinalPoints::SOUTH
      @facing = CardinalPoints::EAST
    when CardinalPoints::EAST
      @facing = CardinalPoints::NORTH
    end
  end

  def right
    return unless @is_placed

    case @facing
    when CardinalPoints::NORTH
      @facing = CardinalPoints::EAST
    when CardinalPoints::EAST
      @facing = CardinalPoints::SOUTH
    when CardinalPoints::SOUTH
      @facing = CardinalPoints::WEST
    when CardinalPoints::WEST
      @facing = CardinalPoints::NORTH
    end
  end

  def is_placed?
    return @is_placed
  end

end
