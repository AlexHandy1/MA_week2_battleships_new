class Board

  attr_accessor :grid, :guesses, :ships, :ship_positions

  def initialize(size = 10)
    @grid = Array.new(size){Array.new(size)}
    @ships = []
    @guesses = []
    @ship_positions = []
  end

  def place ship

  end

  def check_grid square

  end

end