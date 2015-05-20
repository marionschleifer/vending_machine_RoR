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
  end

  def turnable?
    !@open
  end

end