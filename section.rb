require_relative 'article'

class Section

  def new_article(article)
    @article = article
    @empty = false
  end

end