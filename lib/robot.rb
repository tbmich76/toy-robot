require_relative "robot_state"
require_relative "position"
require_relative "cardinal_points"

class Robot
  attr_reader :state

  def initialize
    @state = RobotState.new
  end

  public
  def handleCommand(input)
    tokens = input.downcase.split(" ")
    command = tokens[0]
    case command
    when "place"
      args = tokens[1].split(",")
      position = Position.new(args[0].to_i, args[1].to_i)
      @state.place(position, args[2].upcase)
    when "move"
      @state.move
    when "left"
      @state.left
    when "right"
      @state.right
    when "report"
      report
    end
  end

  def report
    return unless @state.is_placed?

    puts "#{@state.position.x},#{@state.position.y},#{@state.facing}"
  end
end

if (ARGV.length == 2 && ARGV[0].downcase == "--filename")
  robot = Robot.new
  file = File.new(ARGV[1], "r")
  while (line = file.gets)
    robot.handleCommand(line)
  end
  file.close
end
