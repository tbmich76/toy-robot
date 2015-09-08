require_relative "position"
require_relative "shared_module"

class PlacedState
  include Shared
  attr_reader :name, :position, :facing, :robot

  def initialize(robot, position, facing)
    @robot = robot
    @position = position
    @facing = facing
  end

  def move
    moves = { Position::FACING_NORTH => Position.new(@position.x, @position.y+1),
              Position::FACING_SOUTH => Position.new(@position.x, @position.y-1),
              Position::FACING_WEST => Position.new(@position.x-1, @position.y),
              Position::FACING_EAST => Position.new(@position.x+1, @position.y) }

    new_position = moves[@facing]

    return unless new_position.is_on_table?
    @robot.state = PlacedState.new(@robot, new_position, @facing)
  end

  def left
    left_turns = { Position::FACING_NORTH => Position::FACING_WEST,
                   Position::FACING_WEST => Position::FACING_SOUTH,
                   Position::FACING_SOUTH => Position::FACING_EAST,
                   Position::FACING_EAST => Position::FACING_NORTH }

    @robot.state = PlacedState.new(@robot, @position, left_turns[@facing])
  end

  def right
    right_turns = { Position::FACING_NORTH => Position::FACING_EAST,
                    Position::FACING_EAST => Position::FACING_SOUTH,
                    Position::FACING_SOUTH => Position::FACING_WEST,
                    Position::FACING_WEST => Position::FACING_NORTH }

    @robot.state = PlacedState.new(@robot, @position, right_turns[@facing])
  end

  def ==(other)
    return false if other == nil
    return other.position == @position &&
      other.facing == @facing &&
      other.robot == @robot &&
      other.name == @name
  end
end
