require_relative 'ship'

class Carrier < Ship

  attr_accessor :position, :floating, :hits, :size, :direction, :all_blocks

  def initialize (position = "A1", direction = "H")
    @position = position
    @all_blocks = []
    @floating = true
    @hits = 0
    @size = 5
    @direction = direction
  end

end