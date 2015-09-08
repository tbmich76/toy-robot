require "spec_helper"
require "placed_state"
require "position"

describe PlacedState do

  before(:each) do
    @robot = double("Robot")
  end

  describe "#new" do

    context "when passed values" do

      before(:each) do
        @position = Position.new(0, 1)
        @facing = Position::FACING_NORTH
        @state = PlacedState.new(@robot, @position, @facing)
      end

      it "is instantiated with correct position" do
        expect(@state.position).to be(@position)
      end

      it "is instantiated with correct facing" do
        expect(@state.facing).to be(@facing)
      end

      it "is instantiated with the robot" do
        expect(@state.robot).to be(@robot)
      end
    end
  end

  describe "#move" do

    context "when facing NORTH" do

      it "moves up the table 1 position" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position.new(0, 1), Position::FACING_NORTH))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_NORTH)
        state.move
      end

      it "doesn't move off the table" do
        state = PlacedState.new(@robot, Position.new(0, 4), Position::FACING_NORTH)
        state.move
      end

    end

    context "when facing SOUTH" do

      it "moves down the table 1 position" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position.new(0, 1), Position::FACING_SOUTH))
        state = PlacedState.new(@robot, Position.new(0, 2), Position::FACING_SOUTH)
        state.move
      end

      it "doesn't move off the table" do
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_SOUTH)
        state.move
      end

    end

    context "when facing west" do

      it "moves across the table to the left 1 position" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position.new(1, 2), Position::FACING_WEST))
        state = PlacedState.new(@robot, Position.new(2, 2), Position::FACING_WEST)
        state.move
      end

      it "doesn't move off the table" do
        state = PlacedState.new(@robot, Position.new(0,2), Position::FACING_WEST)
        state.move
      end

    end

    context "when facing EAST" do

      it "moves across the table to the right 1 position" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position.new(3, 2), Position::FACING_EAST))
        state = PlacedState.new(@robot, Position.new(2, 2), Position::FACING_EAST)
        state.move
      end

      it "doesn't move east off the table" do
        state = PlacedState.new(@robot, Position.new(4,2), Position::FACING_EAST)
        state.move
      end

    end

  end

  describe "left" do

    context "when placed" do

      it "turns from NORTH to WEST" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_WEST))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_NORTH)
        state.left
      end

      it "turns from WEST to SOUTH" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_SOUTH))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_WEST)
        state.left
      end

      it "turns from SOUTH to EAST" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_EAST))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_SOUTH)
        state.left
      end

      it "turns from EAST to NORTH" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_NORTH))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_EAST)
        state.left
      end
    end

  end

  describe "right" do

    context "when placed on table" do

      it "turns from NORTH to EAST" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_EAST))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_NORTH)
        state.right
      end

      it "turns from EAST to SOUTH" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_SOUTH))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_EAST)
        state.right
      end

      it "turns from SOUTH to WEST" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_WEST))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_SOUTH)
        state.right
      end

      it "turns from WEST to NORTH" do
        expect(@robot).to receive(:state=).with(PlacedState.new(@robot, Position::ORIGIN, Position::FACING_NORTH))
        state = PlacedState.new(@robot, Position::ORIGIN, Position::FACING_WEST)
        state.right
      end
    end

  end

end
