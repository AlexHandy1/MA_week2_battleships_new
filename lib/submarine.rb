require_relative 'ship'

class Submarine < Ship
  def initialize (position = "A1", direction = "H")
    super
    @size = 1
  end
end