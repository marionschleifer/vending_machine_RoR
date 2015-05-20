require_relative 'turn_table'

class Machine
  attr_reader :rows
  attr_reader :current_position

  def initialize(rows, positions)
    @rows = []
    @max_positions = positions
    @current_position = 1
    rows.times { @rows << TurnTable.new(positions) }
  end

  def turn
    if turnable?
      true
      rotate_position
      true
    else
      false
    end
  end

  private

  def turnable?
    counter_turnable_turntables = 0
    @rows.each do |row|
      if row.turnable?
        counter_turnable_turntables += 1
      end
    end
    if counter_turnable_turntables == @rows.count
      true
    else
      false
    end
  end

  def rotate_position
    if @current_position < @max_positions
      @current_position += 1
    else
      @current_position = 1
    end
  end
end