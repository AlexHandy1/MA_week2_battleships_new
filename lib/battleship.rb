require_relative 'ship'

class Battleship < Ship
  def initialize (position = "A1", direction = "H")
    super
    @size = 4
  end
end