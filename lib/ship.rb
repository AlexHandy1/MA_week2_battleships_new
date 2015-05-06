class Ship

  attr_accessor :position, :floating, :hits, :size

  def initialize (position = "A1", size)
    @position = position
    @floating = true
    @hits = 0
    @size = size
  end

end