class CoinStorage
  attr_reader :coins

  def initialize
    @coins = {
      200 => 0,
      100 => 0,
      50 => 0,
      20 => 0,
      10 => 0,
    }
  end

  def sufficient_change?(change)
    returning_change = []
    remaining_change = change
    @coins.each do |coin, count|
      coin_amount = (remaining_change / coin).floor
      next if coin_amount < 1
      coin_amount.times { returning_change << coin }
      remaining_change -= returning_change.inject(:+)
    end
    change == returning_change.inject(:+)
  end

  def give_change(change)
  end

  def add_coins(coin_type, quantity)
    @coins[coin_type] += quantity
  end

  def capacity?(coin_type, quantity)
    @coins[coin_type] + quantity <= 100
  end

  def total
    @total = 0
    @coins.each { |coin, count| @total += coin * count }
    return @total
  end

  def total_per(coin_type)
    coin_type * @coins[coin_type]
  end

  def remove_change(coin_type, quantity)
    @coins[coin_type] -= quantity
  end

end
