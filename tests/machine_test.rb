require_relative '../machine'
require_relative '../turn_table'
require 'minitest/spec'
require 'minitest/autorun'

class MachineTest < MiniTest::Test
  def setup
    @machine = Machine.new
  end

  def test_turn_16_times
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    position = @machine.turn
    assert_equal(1, position) #i know this is crappy and can be done easier, but somehow it doesn't work with 16.times do
  end

   def test_only_turn_if_all_turntables_are_closed
  	@machine.turn_tables[2].open
  	assert_equal(nil, @machine.turn)
  end

end