require_relative "unplaced_state"
require_relative "placed_state"
require_relative "position"

class Robot
  attr_accessor :state

  def initialize
    @state = UnplacedState.new(self)
  end

  public
  def handleCommand(input)
    tokens = input.downcase.split(" ")
    command = tokens[0]
    case command
    when "place"
      args = tokens[1].split(",")
      position = Position.new(args[0].to_i, args[1].to_i)
      @state.place(position, args[2].downcase.intern)
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
    return if @state.is_a?(UnplacedState)

    puts "#{@state.position.x},#{@state.position.y},#{@state.facing.to_s.upcase}"
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
