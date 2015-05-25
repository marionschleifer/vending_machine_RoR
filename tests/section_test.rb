require_relative '../section'
require 'minitest/spec'
require 'minitest/autorun'

class SectionTest < MiniTest::Test

  def setup
    @section = Section.new(StatisticLog.new)
  end

  def test_add_article
    assert(!@section.article)
    @section.add_article(Article.new('Mars', 1.2, Date.new(2016, 01, 01)))
    assert(@section.article)
  end

  def test_remove_article
    @section.add_article(Article.new('Mars', 1.2, Date.new(2016, 01, 01)))
    assert(@section.article)
    @section.remove_article
    assert_equal(true, @section.empty?)
  end

  def test_replace_article
    @section.add_article(Article.new('Mars', 1.2, Date.new(2016, 01, 01)))
    assert(@section.article)
    @section.add_article(Article.new('Snickers', 2.2, Date.new(2016, 10, 10)))
    assert(@section.article)
  end

end