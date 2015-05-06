class Ship

  attr_accessor :position, :floating, :hits, :size, :direction, :all_blocks

  def initialize (position = "A1", direction = "H")
    @position = position
    @all_blocks = []
    @floating = true
    @hits = 0
    @size = 1
    @direction = direction
  end

  def floating?
    @floating
  end

  def sunk?
    !@floating
  end

  def is_hit
    @hits += 1
  end

  def is_sunk
    @floating = false if @hits >= @size
    return @floating
  end
end