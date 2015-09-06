require "spec_helper"
require "position"

describe Position do
  describe "#new" do

    it "is initialized at x == 0 to 4" do
      for x in 0..4
        expect(Position.new(x, 0).is_valid?).to be true
      end
    end

    it "is not initialized for invalid y values" do
      invalid_x_values = [-1,10,5]
      invalid_x_values.each do |x|
        expect(Position.new(x, 0).is_valid?).to be false
      end
    end

    it "is initialized at y == 0 to 4" do
      for y in 0..4
        expect(Position.new(0, y).is_valid?).to be true
      end
    end

    it "is not initialized for invalid y values" do
      invalid_y_values = [-1,10,5]
      invalid_y_values.each do |y|
        expect(Position.new(0, y).is_valid?).to be false
      end
    end
  end
end
