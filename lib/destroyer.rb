require_relative 'ship'

class Destroyer < Ship
  attr_accessor :position, :floating, :hits, :size, :direction, :all_blocks
  def initialize(position = "A1", direction = "H")
    @position = position
    @all_blocks = []
    @floating = true
    @size = 2
    @hits = 0
    @direction = direction
  end
end