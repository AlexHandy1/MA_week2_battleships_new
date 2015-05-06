require_relative 'ship'

class Destroyer < Ship
  attr_accessor :position, :floating, :hits, :size, :direction
  def initialize(position = "A1", direction = "H")
    @position = position
    @floating = true
    @size = 2
    @hits = 0
    @direction = direction
  end
end