require_relative '../coin_storage'
require 'minitest/spec'
require 'minitest/autorun'

class CoinStorageTest < MiniTest::Test
  def setup
    @coin_storage = CoinStorage.new
  end

  def test_add_coins
    @coin_storage.add_coins(10, 2)
    assert_equal 2, @coin_storage.slots[10]
  end

  def test_capacity
    @coin_storage.add_coins(20, 2)
    assert @coin_storage.capacity?(20, 4)
    @coin_storage.add_coins(20, 100)
    assert !@coin_storage.capacity?(20, 4)
  end

  def test_calculate_total
    @coin_storage.add_coins(20, 2)
    @coin_storage.add_coins(50, 2)
    assert_equal 140, @coin_storage.total
  end

  def test_calculate_slot_total
    @coin_storage.add_coins(50, 2)
    assert_equal 100, @coin_storage.slot_total(50)
  end

  def test_sufficient_change
    @coin_storage.add_coins(20, 1)
    @coin_storage.add_coins(50, 1)
    assert @coin_storage.sufficient_change?(70)
    assert !@coin_storage.sufficient_change?(80)
  end

  def test_remove_coins
    @coin_storage.add_coins(50, 2)
    @coin_storage.remove_coins(50, 1)
    assert_equal 50, @coin_storage.slot_total(50)
  end

  def test_give_change
    @coin_storage.add_coins(50, 2)
    @coin_storage.add_coins(20, 2)
    @coin_storage.add_coins(10, 3)
    assert_equal 100, @coin_storage.slot_total(50)
    assert_equal 40, @coin_storage.slot_total(20)
    assert_equal 30, @coin_storage.slot_total(10)
    @coin_storage.give_change(80)
    assert_equal 50, @coin_storage.slot_total(50)
    assert_equal 20, @coin_storage.slot_total(20)
    assert_equal 20, @coin_storage.slot_total(10)
    @coin_storage.give_change(60)
    assert_equal 0, @coin_storage.slot_total(50)
    assert_equal 20, @coin_storage.slot_total(20)
    assert_equal 10, @coin_storage.slot_total(10)
  end

end