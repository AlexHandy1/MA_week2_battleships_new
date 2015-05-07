require_relative 'ship'

class Destroyer < Ship
  def initialize(position = "A1", direction = "H") #not taking parameters
    super
    @size = 2
  end
end