require "spec_helper"
require "unplaced_state"
require "placed_state"
require "position"

describe UnplacedState do

  before(:each) do
    @robot = double("Robot")
  end

  describe "#new" do

    context "when passed the robot" do

      it "is instantiated with the robot" do
        state = UnplacedState.new(@robot)
        expect(state.robot).to be(@robot)
      end

    end

  end

  describe "#place" do

    context "when passed valid arguments" do

      it "is placed for f == NORTH,EAST,SOUTH,WEST" do

        directions = ["NORTH","north","EAST","east","SOUTH","south","WEST","west"]
        directions.each do |f|
          expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, f.downcase.intern))

          state = UnplacedState.new(@robot)
          state.place(Position::ORIGIN, f.downcase.intern)
        end
      end

    end

    it "is placed in correct position" do

      position = Position.new(2, 2)
      expect(@robot).to receive(:state=).with(PlacedState.new(@robot, position, Position::FACING_NORTH))

      state = UnplacedState.new(@robot)
      state.place(position, Position::FACING_NORTH)
    end

    context "when passed invalid arguments" do

      it "is not placed" do
        allow(@robot).to receive(:state)

        invalid_f_values = ["N","W","E","S",0,1,2,3,4]
        invalid_f_values.each do |f|
          state = UnplacedState.new(@robot)
          state.place(Position::ORIGIN, f)
        end

      end

    end

  end

  describe "#move" do

    context "always" do

      it "will not move" do
        state = UnplacedState.new(@robot)
        state.move
      end

    end
  end

  describe "left" do

    context "always" do

      it "will not turn" do
        state = UnplacedState.new(@robot)
        state.left
      end

    end
  end

  describe "right" do

    context "always" do

      it "will not turn" do
        state = UnplacedState.new(@robot)
        state.right
      end

    end
  end
end
