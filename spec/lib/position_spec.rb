require "spec_helper"
require "position"

describe Position do
  describe "#new" do

    context "when initialized with valid values" do
      it "is on the table" do
        for i in 0..4
          expect(Position.new(i, i).is_on_table?).to be true
        end
      end
    end

    context "when initialized with invalid values" do

      it "is not on the table for invalid x values" do
        invalid_values = [[-1, 2],[10, 2],[5, 2],[2, -1],[2, 10],[2, 5]]
        invalid_values.each do |p|
          expect(Position.new(p[0], p[1]).is_on_table?).to be false
        end
      end

    end

    context "when initialized at the Origin" do

      it "position == 0, 0" do
        expect(Position::ORIGIN).to eq Position.new(0, 0)
      end

    end
  end
end
