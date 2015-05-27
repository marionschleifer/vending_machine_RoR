require_relative '../coin_slot'
require 'minitest/spec'
require 'minitest/autorun'

class CoinSlotTest < MiniTest::Test
  def setup
    @coin_slot = CoinSlot.new
  end

  def test_allowed_coin?
    assert @coin_slot.allowed_coin?(100)
  end

  def test_add_coins
    @coin_slot.add(100)
    @coin_slot.add(200)
    assert_equal 300, @coin_slot.total
  end

  def test_only_add_allowed_coins
    @coin_slot.add(100)
    @coin_slot.add(150)
    assert_equal 100, @coin_slot.total
  end

  def test_cancel
    @coin_slot.add(100)
    @coin_slot.add(200)
    @coin_slot.cancel
    assert_equal 0, @coin_slot.total
  end

end