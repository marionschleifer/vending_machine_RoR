require 'singleton'

class StatisticLog
  include Singleton

  def initialize
    @sold_articles = {}
  end

  def add_sold_article(article, sold_at)
    if @sold_articles.has_key?(article.name)
      @sold_articles[article.name] << sold_at
    else
      @sold_articles[article.name] = [sold_at]
    end
  end

  def sold_articles(article_name, start_date)
    return 0 unless @sold_articles.has_key?(article_name)
    dates = @sold_articles[article_name]
    dates.select { |date| date >= start_date }.count   #ja, das habe ich selber herausgefunden :D
  end
end
