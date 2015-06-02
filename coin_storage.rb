class CoinStorage
  attr_reader :slots

  def initialize
    @slots = { 200 => 0, 100 => 0, 50 => 0, 20 => 0, 10 => 0 }
  end

  def sufficient_change?(change)
    returning_change = []
    remaining_change = change
    @slots.each do |coin, count|
      coin_amount = (remaining_change / coin).floor
      next if coin_amount < 1
      coin_amount.times { returning_change << coin }
      remaining_change -= returning_change.inject(:+)
    end
    change == returning_change.inject(:+)
  end

  def give_change(change)
    returning_change = []
    remaining_change = change
    @slots.each do |coin, count|
      coin_amount = (remaining_change / coin).floor
      next if coin_amount < 1
      coin_amount.times do
        returning_change << coin
        remove_change(coin, 1)
      end
      remaining_change -= returning_change.inject(:+)
    end
    change == returning_change.inject(:+)
  end

  def add_coins(coin_type, quantity)
    @slots[coin_type] += quantity
  end

  def remove_coins(coin_type, quantity)
    @slots[coin_type] -= quantity
  end

  def capacity?(coin_type, quantity)
    @slots[coin_type] + quantity <= 100
  end

  def total
    @slots.inject(0) { |memo, (coin, count)| coin * count }
  end

  def total_per(coin_type)
    coin_type * @slots[coin_type]
  end
end
