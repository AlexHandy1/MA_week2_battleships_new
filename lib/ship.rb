class Ship

  attr_accessor :position, :floating, :hits, :size

  def initialize (position = "A1" )
    @position = position
    @floating = true
    @hits = 0
    @size = 1
  end

end