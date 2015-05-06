require_relative 'ship'

class Carrier < Ship
  attr_accessor :position, :floating, :hits, :size, :direction
  def initialize(position = "A1", direction = "H")
    @position = position
    @floating = true
    @size = 5
    @hits = 0
    @direction = direction
  end
end