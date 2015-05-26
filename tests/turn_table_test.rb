require_relative '../turn_table'
require 'minitest/spec'
require 'minitest/autorun'

class TurnTableTest < MiniTest::Test

  def setup
    @turn_table = TurnTable.new(16)
  end

  def test_not_turnable_if_open
    @turn_table.current_section.add_article(Article.new('Mars', 1.2, Date.new(2016, 1, 1)))
    @turn_table.unlock
    assert !@turn_table.turnable?
  end

  def test_status_light
    assert_equal(:off, @turn_table.status_light)
    @turn_table.current_section.add_article(Article.new('Mars', 1.2, Date.today + 1))
    assert_equal(:green, @turn_table.status_light)
    @turn_table.current_section.add_article(Article.new('Snickers', 2.2, Date.today - 1))
    assert_equal(:red, @turn_table.status_light)
    @turn_table.unlock
    assert_equal(:off, @turn_table.status_light)
  end
end
