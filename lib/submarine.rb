require_relative 'ship'

class Submarine < Ship
  attr_accessor :position, :floating, :hits, :size
   def initialize(position = "A1", direction = "H")
    @position = position
    @floating = true
    @size = 1
    @hits = 0
    @direction = direction
  end
end