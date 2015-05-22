require_relative 'article'

class Section

  def initialize
    @empty = true
  end

  def add_article(article)
    @article = article
    @empty = false
  end

  def remove_article
    @article = nil
    @empty = true
  end

end