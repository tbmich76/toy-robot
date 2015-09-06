require "spec_helper"
require "robot_state"
require "position"

describe RobotState do

  describe "#place" do

    it "is initialized for f == NORTH,EAST,SOUTH,WEST" do
      directions = ["NORTH","north","EAST","east","SOUTH","south","WEST","west"]
      directions.each do |f|
        state = RobotState.new
        state.place(0,0,f)
        expect(state.is_placed).to be true
      end
    end

    it "is placed in correct position" do
      state = RobotState.new
      state.place(2,2,"NORTH")
      expect(state.position).to eq Position.new(2,2)
    end

    it "is not initialized for invalid f values" do
      invalid_f_values = ["N","W","E","S",0,1,2,3,4]
      invalid_f_values.each do |f|
        state = RobotState.new
        state.place(0, 0, f)
        expect(state.is_placed).to be false
      end
    end
  end

end
