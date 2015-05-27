require_relative 'turn_table'
require_relative 'coin_slot'

class Machine
  attr_reader :turn_tables, :current_position, :coin_slot

  def initialize(rows, positions)
    @coin_slot = CoinSlot.new
    @max_positions = positions
    @current_position = 1
    @turn_tables = (1..rows).map { TurnTable.new(positions) }
  end

  def turn
    return false unless turnable?
    rotate_position
    turn_tables.each { |turn_table| turn_table.current_position = @current_position }
  end

  private

  def turnable?
    turn_tables.all?(&:turnable?)
  end

  def rotate_position
    if current_position < @max_positions
      @current_position += 1
    else
      @current_position = 1
    end
  end
end