require_relative "shared_module"

class UnplacedState
  include Shared
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def move
  end

  def left
  end

  def right
  end
end
