class Ship

  attr_accessor :position, :floating, :hits, :size

  def initialize (position = "A1")
    @position = position
    @floating = true
    @hits = 0
    @size = 0
  end

  def floating?
    @floating
  end

end

class Destroyer < Ship
  def initialize(position = "A2")
    @position = position
    @floating = true
    @size = 2
    @hits = 0
  end
end

class Carrier < Ship
  def initialize(position = "B1")
    @position = position
    @floating = true
    @size = 5
    @hits = 0
  end
end