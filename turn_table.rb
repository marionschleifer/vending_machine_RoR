require_relative 'section'
require 'date'

class TurnTable

  attr_reader :sections

  def initialize(positions)
    @open = false
    @current_position = 1
    @status_light = 'off'
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

#later: link to method "add_article"
  def set_status_light(expiry_date)
    if Date.today <= expiry_date
      @status_light = 'green'
    elsif Date.today > expiry_date
      @status_light = 'red'
    else
      @status_light = 'off'
    end
  end

end