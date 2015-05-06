class Ship

  attr_accessor :position, :floating, :hits, :size, :direction

  def initialize (position = "A1", direction = "H")
    @position = position
    @floating = true
    @hits = 0
    @size = 1
    @direction = direction
  end

  def floating?
    @floating
  end

end