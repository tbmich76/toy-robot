require "spec_helper"
require "robot"
require "robot_state"
require "position"

describe Robot do

  describe "#handleCommand" do

    context "when place is issued" do

      it "reports correct position and facing direction" do
        robot = Robot.new
        robot.handleCommand("PLACE 0,1,NORTH")
        expect { robot.handleCommand("REPORT") }.to output("0,1,NORTH\n").to_stdout
      end

    end

    context "when move is issued" do

      it "reports correct position and direction facing" do
        robot = Robot.new
        robot.handleCommand("PLACE 0,1,EAST")
        robot.handleCommand("MOVE")
        expect { robot.handleCommand("REPORT") }.to output("1,1,EAST\n").to_stdout
      end

    end

    context "when left is issued" do

      it "reports correct position and direction facing" do
        robot = Robot.new
        robot.handleCommand("PLACE 0,1,EAST")
        robot.handleCommand("LEFT")
        expect { robot.handleCommand("REPORT") }.to output("0,1,NORTH\n").to_stdout
      end

    end

    context "when right is issued" do

      it "reports correct position and direction facing" do
        robot = Robot.new
        robot.handleCommand("PLACE 0,1,EAST")
        robot.handleCommand("RIGHT")
        expect { robot.handleCommand("REPORT") }.to output("0,1,SOUTH\n").to_stdout
      end

    end

    context "when report is issued before a place has been issued" do

      it "ignores command" do
        robot = Robot.new
        expect { robot.handleCommand("REPORT") }.to output("").to_stdout
      end

    end

  end

end
