require_relative 'ship'

class Cruiser < Ship
  def initialize (position = "A1", direction = "H")
    super
    @size = 3
  end

end