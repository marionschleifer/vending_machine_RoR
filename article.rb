class Article

  attr_reader :expiry_date, :name

  def initialize(name, price, expiry_date)
    @name = name
    @price = price
    @expiry_date = expiry_date
  end

  def expiry_date_exceeded?
    @expiry_date < Date.today
  end

end