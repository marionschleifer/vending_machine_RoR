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

  def current_position=(current_position)
    @current_position = current_position
  end

  def lock
    @open = false
  end

  def unlock
    @open = true
    current_section.remove_article
  end

  def turnable?
    !@open
  end

  def current_section
    @sections[@current_position]
  end

  def current_article
    current_section.article
  end

  def status_light
    return :off if current_section.empty?
    return :red if current_article.expiry_date_exceeded?
    :green
  end
end
