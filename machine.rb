require_relative 'turn_table'

class Machine

	attr_accessor :turn_tables

	def initialize
		@turn_tables = []
		7.times do
			@turn_tables << TurnTable.new
		end
		@positions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
	end

	def turn
		counter_turnable_turntables = 0
		@turn_tables.each do |turn_table|
			if turn_table.turnable?
				counter_turnable_turntables += 1
			end
		end
		if counter_turnable_turntables == 7
			position = @positions[0]
			position = @positions.rotate!(1)
			@positions[0]
		end

	end

end

machine = Machine.new
