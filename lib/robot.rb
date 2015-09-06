class Robot
  attr_reader :position, :state

  def initialize
    @state = RobotState.new
  end

  public
  def handleCommand(command, *args)
    puts "#{command}: x: #{args[0]}, y: #{args[1]}, f: #{args[2]}"
    case command.downcase
    when "place"
      @state.place(args[0],args[1],args[2])
    when "move"
      @state.move
    end
  end

  def report
    puts "#{@state.position.x},#{@state.position.y},#{@state.orientation}"
  end
end
