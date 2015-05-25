class StatisticLog

  def initialize
    @sold_articles = {}
  end

  def add_sold_article(article, sold_at)
    article_name = article.name
    if @sold_articles.has_key?(article_name)
      @sold_articles[article_name] << sold_at
    else
      @sold_articles[article_name] = []
      @sold_articles[article_name] << sold_at  #das kann man sicher noch kuerzer machen, aber ich wusste nicht wie
    end
  end

  def sold_articles(article_name, start_date)
    return 0 unless @sold_articles.has_key?(article_name)
    dates = @sold_articles[article_name]
    dates.select { |date| date >= start_date }.count   #ja, das habe ich selber herausgefunden :D
  end

end
