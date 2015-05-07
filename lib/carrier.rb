require_relative 'ship'

class Carrier < Ship
  def initialize (position = "A1", direction = "H")
    super
    @size = 5
  end
end