require_relative 'ship'

class Cruiser < Ship

  attr_accessor :position, :floating, :hits, :size, :direction, :all_blocks

  def initialize (position = "A1", direction = "H")
    @position = position
    @all_blocks = []
    @floating = true
    @hits = 0
    @size = 3
    @direction = direction
  end

end