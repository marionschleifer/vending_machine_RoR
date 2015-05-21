require_relative 'article'

class Section

  def initialize
    @empty = true
  end

  def empty?
    @empty
  end

  def fill_with_article(article)
    if @empty
      @article = Article.new(nil)  #hier bin ich nicht sicher, ich muss hier ja eigentlich einen bestimmten Article erstellen.
      @empty = false
    else
      replace_article(article)
    end
  end

  def replace_article(article)
    @article = Article.new(nil)
  end
end

#vielleicht waere so etwas noch einfacher:

class Section
  def initialize
    @article = nil
  end
  def new_article(article)
    @article = Article.new(nil)
  end
end

#wenn es den @article schon gibt, wird er dann einfach ueberschrieben, oder vergesse ich hier was?
