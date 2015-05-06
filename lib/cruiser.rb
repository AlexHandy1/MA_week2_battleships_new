require_relative 'ship'

class Cruiser < Ship
  attr_accessor :position, :floating, :hits, :size, :direction
   def initialize(position = "A1", direction = "H")
    @position = position
    @floating = true
    @size = 3
    @hits = 0
    @direction = direction
  end
end