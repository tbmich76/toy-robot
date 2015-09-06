require "spec_helper"
require "robot"
require "robot_state"
require "position"

describe Robot do

  describe "#place" do

    before(:each) do
      @robot = Robot.new
      @robot.handleCommand("PLACE", 0, 0, "NORTH")
    end

    it "#place" do
      expect(@robot.state.position).to eq(Position.new(0,0))
    end

    it "#place" do
      expect(@robot.state.orientation).to eq("NORTH")
    end

  end

  describe "#report" do

    it "#report" do
      robot = Robot.new
      robot.handleCommand("PLACE", 0, 1, "NORTH")
      expect { robot.report }.to output("0,1,NORTH\n").to_stdout
    end

  end

  describe "#move" do

    before(:each) do
      @robot = Robot.new
      @robot.handleCommand("PLACE", 0, 0, "NORTH")
      @robot.handleCommand("MOVE")
    end

    it "#moves to the correct position" do
      expect(@robot.state.position).to eq(Position.new(0,1))
    end

    it "is facing the right direction" do
      expect(@robot.state.orientation).to eq("NORTH")
    end

  end

  describe "#move south" do

    before(:each) do
      @robot = Robot.new
      @robot.handleCommand("PLACE", 0, 2, "SOUTH")
      @robot.handleCommand("MOVE")
    end

    it "#move" do
      expect(@robot.state.position).to eq(Position.new(0,1))
    end

    it "#move" do
      expect(@robot.state.orientation).to eq("SOUTH")
    end

  end
end
