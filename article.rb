class Article

  attr_reader :expiry_date

  def initialize(name, price, expiry_date)
    @name = name
    @price = price
    @expiry_date = expiry_date
  end

end