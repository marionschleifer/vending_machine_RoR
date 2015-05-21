require_relative 'article'

class Section

  def initialize
    @empty = true
    @open = false    #beim TurnTable gibt es auch ein @open, das muss man vielleicht noch verbinden
  end                #aber momentan kennt nur der TurnTable die Section und nicht umgekehrt
                      #kann ich die Verbindung bidirektional machen?
  def new_article(article)
    @article = article
    @empty = false
  end

  def open
    if @empty == false   #later: also if expiry date not exceeded
      @open = true
    end
  end

  def remove_article
    @article = nil
    @empty = true
  end

  def close
    @open = false
  end

end