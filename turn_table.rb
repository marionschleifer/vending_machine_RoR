require_relative 'section'

class TurnTable

  attr_reader :sections

  def initialize(positions)
    @open = false
    @current_position = 1
    @sections = []
    positions.times do
      @sections << Section.new
    end
  end

  def position(value)
    @current_position
  end

  def lock
    @open = false
  end

  def unlock
    @open = true
    @sections[@current_position].remove_article
  end

  def turnable?
    !@open
  end

end