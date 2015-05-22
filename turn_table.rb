require_relative 'section'

class TurnTable

  attr_reader :sections

  def initialize(positions)
    @open = false
    @sections = []
    positions.times do
      @sections << Section.new
    end
  end

  def lock
    @open = false
  end

  def unlock
    @open = true
    @sections[i].remove_article #kann ich das so machen? in der Beschreibung steht ja, dass
  end                            #wenn man es oeffnet, die Ware als verkauft gilt.

  def turnable?
    !@open
  end

end