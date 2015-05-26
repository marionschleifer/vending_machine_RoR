require_relative '../statistic_log'
require_relative '../section'

require 'minitest/spec'
require 'minitest/autorun'

class StatisticLogTest < MiniTest::Test

  def setup
    @statistic_log = StatisticLog.instance
    @expiry_date = Date.new(2015, 12, 31)
    @start_date = Date.new(2015, 01, 10)
    @sold_at = Date.new(2015, 2, 14)
  end

  def test_number_of_sold_articles
    assert_equal(0, @statistic_log.sold_articles('Mars', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), @sold_at)
    assert_equal(1, @statistic_log.sold_articles('Mars', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), @sold_at)
    assert_equal(2, @statistic_log.sold_articles('Mars', @start_date))
  end

  def test_number_of_sold_articles_with_different_articles
    assert_equal(0, @statistic_log.sold_articles('Mars', @start_date))
    assert_equal(0, @statistic_log.sold_articles('Snickers', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), @sold_at)
    assert_equal(1, @statistic_log.sold_articles('Mars', @start_date))
    assert_equal(0, @statistic_log.sold_articles('Snickers', @start_date))
  end

  def test_number_of_sold_articles_within_time_period
    assert_equal(0, @statistic_log.sold_articles('Mars', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), Date.new(2015, 1, 9))
    assert_equal(0, @statistic_log.sold_articles('Mars', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), Date.new(2015, 1, 11))
    assert_equal(1, @statistic_log.sold_articles('Mars', @start_date))
    @statistic_log.add_sold_article(Article.new('Mars', 1.2, @expiry_date), Date.new(2015, 1, 10))
    assert_equal(2, @statistic_log.sold_articles('Mars', @start_date))
  end

end