require "spec_helper"
require "robot_state"
require "position"
require "cardinal_points"

describe RobotState do

  describe "#place" do

    context "when passed valid arguments" do

      it "is initialized for f == NORTH,EAST,SOUTH,WEST" do
        directions = ["NORTH","north","EAST","east","SOUTH","south","WEST","west"]
        directions.each do |f|
          state = RobotState.new
          state.place(Position::ORIGIN, f)
          expect(state.is_placed?).to be true
        end
      end

    end

    it "is placed in correct position" do
      state = RobotState.new
      state.place(Position.new(2, 2),"NORTH")
      expect(state.position).to eq Position.new(2,2)
    end

    context "when passed invalid arguments" do

      it "is not initialized for invalid f values" do
        invalid_f_values = ["N","W","E","S",0,1,2,3,4]
        invalid_f_values.each do |f|
          state = RobotState.new
          state.place(Position::ORIGIN, f)
          expect(state.is_placed?).to be false
        end
      end
    end
  end

  describe "#move" do

    context "when not placed" do

      it "will not move" do
        state = RobotState.new
        state.move
        expect(state.position).to be nil
      end

    end

    context "when facing NORTH" do

      it "moves up the table 1 position" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::NORTH)
        state.move
        expect(state.position).to eq Position.new(0, 1)
      end

      it "doesn't move off the table" do
        state = RobotState.new
        state.place(Position.new(0, 4), CardinalPoints::NORTH)
        state.move
        expect(state.position).to eq Position.new(0, 4)
      end

    end

    context "when facing SOUTH" do

      it "moves down the table 1 position" do
        state = RobotState.new
        state.place(Position.new(0, 2), CardinalPoints::SOUTH)
        state.move
        expect(state.position).to eq Position.new(0, 1)
      end

      it "doesn't move off the table" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::SOUTH)
        state.move
        expect(state.position).to eq Position::ORIGIN
      end

    end

    context "when facing west" do

      it "moves across the table to the left 1 position" do
        state = RobotState.new
        state.place(Position.new(2, 2), CardinalPoints::WEST)
        state.move
        expect(state.position).to eq Position.new(1, 2)
      end

      it "doesn't move off the table" do
        state = RobotState.new
        state.place(Position.new(0,2), CardinalPoints::WEST)
        state.move
        expect(state.position).to eq Position.new(0, 2)
      end

    end

    context "when facing EAST" do

      it "moves across the table to the right 1 position" do
        state = RobotState.new
        state.place(Position.new(2, 2), CardinalPoints::EAST)
        state.move
        expect(state.position).to eq Position.new(3, 2)
      end

      it "doesn't move east off the table" do
        state = RobotState.new
        state.place(Position.new(4,2), CardinalPoints::EAST)
        state.move
        expect(state.position).to eq Position.new(4, 2)
      end

    end

  end

  describe "left" do

    context "when not placed on the table" do

      it "will not turn" do
        state = RobotState.new
        state.left
        expect(state.facing).to be nil
      end

    end

    context "when placed" do

      it "turns from NORTH to WEST" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::NORTH)
        state.left
        expect(state.facing).to be CardinalPoints::WEST
      end

      it "turns from WEST to SOUTH" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::WEST)
        state.left
        expect(state.facing).to be CardinalPoints::SOUTH
      end

      it "turns from SOUTH to EAST" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::SOUTH)
        state.left
        expect(state.facing).to be CardinalPoints::EAST
      end

      it "turns from EAST to NORTH" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::EAST)
        state.left
        expect(state.facing).to be CardinalPoints::NORTH
      end
    end

  end

  describe "right" do

    context "when not placed on the table" do

      it "will not turn" do
        state = RobotState.new
        state.right
        expect(state.facing).to be nil
      end

    end

    context "when placed on table" do

      it "turns from NORTH to EAST" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::NORTH)
        state.right
        expect(state.facing).to be CardinalPoints::EAST
      end

      it "turns from EAST to SOUTH" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::EAST)
        state.right
        expect(state.facing).to be CardinalPoints::SOUTH
      end

      it "turns from SOUTH to WEST" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::SOUTH)
        state.right
        expect(state.facing).to be CardinalPoints::WEST
      end

      it "turns from WEST to NORTH" do
        state = RobotState.new
        state.place(Position::ORIGIN, CardinalPoints::WEST)
        state.right
        expect(state.facing).to be CardinalPoints::NORTH
      end
    end

  end

end
