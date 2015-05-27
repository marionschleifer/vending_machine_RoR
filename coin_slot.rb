require_relative 'coin_storage'

class CoinSlot
  VALID_COINS = [10, 20, 50, 100, 200]
  attr_reader :total

  def initialize
    @coins = []
    @total = 0
  end

  def allowed_coin?(coin)
    VALID_COINS.include?(coin)
  end

  def add(coin)
    return false unless allowed_coin?(coin)
    @total += coin
    @coins << coin
  end

  def cancel
    @coins = []
    @total = 0
  end
end
