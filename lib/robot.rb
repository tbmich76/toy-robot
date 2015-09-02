class Robot
	attr_accessor :name, :position

	def initialize
		@name = "Tim"
	end

	def place (x, y, f)
		@position = Position.new (x, y, f)
	end
end