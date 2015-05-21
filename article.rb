class Article
require 'date'

  def initialize(name, price, expiry_date)
    @name = name
    @price = price
    @expiry_date = expiry_date
  end

  def mars
    @mars = Article.new('Mars', 3.2, Date.new(2016, 03, 16))
  end

  def snickers
    @snickers = Article.new('Snickers', 3.4, Date.new(2017, 11, 01))
  end

  def twix
    @twix = Article.new('Twix', 3.1, Date.new(2016, 01, 11))
  end

end