require_relative 'section'

class TurnTable

  def initialize
    @open = false
    @sections = []
    16.times do
      @sections << Section.new
    end
  end

  def open
    @open = true
  end

  def turnable?
    if @open == false
      true
    else 
      false
    end
  end

end