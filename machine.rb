require_relative 'turn_table'

class Machine
  attr_reader :turn_tables
  attr_reader :current_position

  def initialize(rows, positions)
    @max_positions = positions
    @current_position = 1
    @turn_tables = (1..rows).map { TurnTable.new(positions) }
  end

  def turn
    return false unless turnable?
    rotate_position
  end

  private

  def turnable?
    @turn_tables.all?(&:turnable?)
  end

  def rotate_position
    if @current_position < @max_positions
      @current_position += 1
    else
      @current_position = 1
    end
  end
end