module Shared
  def place(position, facing)
    return unless Position::CARDINAL_POINTS.include?(facing)
    return unless position != nil && position.is_on_table?

    @robot.state = PlacedState.new(@robot, position, facing)
  end
end
