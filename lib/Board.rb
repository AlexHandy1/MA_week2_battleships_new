require_relative 'ship'

class Board

  attr_accessor :grid, :guesses, :ships, :ship_positions

  def initialize(size = 10)
    @grid = Array.new(size){Array.new(size)}
    @ships = []
    @guesses = []
    @ship_positions = []
  end

  def place ship
    row, col = convertor(ship.position)

    for x in 0..ship.size
      grid[row][col + x] = "ship"
    end

    # if ship.size == 5
    #   grid[row][col] = "ship"
    #   grid[row][col + 1] = "ship"
    #   grid[row][col + 2] = "ship"
    #   grid[row][col + 3] = "ship"
    #   grid[row][col + 4] = "ship"
    # elsif ship.size == 2
    #   grid[row][col] = "ship"
    #   grid[row][col + 1] = "ship"
    # else
    #   grid[row][col] = "ship"
    # end
  end

  def check_grid square
     row, col = convertor(square)
     grid[row][col]
  end

  def convertor square
    alphabet = ("a".."z").to_a
    row = square.downcase.chars.first
    col = square.downcase.chars.last
    coords = alphabet.index(row), (col.to_i) - 1
  end
end