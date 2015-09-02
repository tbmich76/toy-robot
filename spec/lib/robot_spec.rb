require "spec_helper"
require "robot"


describe Robot do
	it "is named Tim" do
		robot = Robot.new
		expect(robot.name).to eq "Tim"
	end

	it "place" do
		robot = Robot.new
		robot.place(0, 0, "N")
		expect(robot.postion).to eq Postion.new(0,0,"N")
	end
end