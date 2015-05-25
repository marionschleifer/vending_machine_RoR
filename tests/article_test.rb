require_relative '../article'
require 'minitest/spec'
require 'minitest/autorun'
require 'date'

class ArticleTest < MiniTest::Test

  def test_expiry_date_exceeded
    @article = Article.new('Mars', 1.2, Date.new(2014, 10, 3))
    assert_equal(true, @article.expiry_date_exceeded?)
  end

end