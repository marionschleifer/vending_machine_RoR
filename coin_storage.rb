class CoinStorage
  attr_reader :slots

  def initialize
    @slots = { 200 => 0, 100 => 0, 50 => 0, 20 => 0, 10 => 0 }
  end

  def sufficient_change?(change)
    change == calculated_change(change).inject(:+)
  end

  def give_change(change)
    return unless sufficient_change?(change)
    calculated_change(change).each do |coin|
      remove_coins(coin, 1)
    end
  end

  def calculated_change(change)
    [].tap do |returning_change|
      @slots.each do |coin, count|
        coins_required = (change / coin).floor
        [count, coins_required].min.times do
          returning_change << coin
          change -= coin
        end
      end
    end
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
    @slots.inject(0) { |sum, (coin, count)| sum + coin * count }
  end

  def slot_total(coin_type)
    coin_type * @slots[coin_type]
  end
end
