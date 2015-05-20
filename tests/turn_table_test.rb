require_relative '../machine'
require_relative '../turn_table'
require 'minitest/spec'
require 'minitest/autorun'

class MachineTest < MiniTest::Test
  def setup
    @machine = Machine.new
  end

  def test_only_turn_if_all_turntables_are_closed
  	@turn_tables.open
  end
end