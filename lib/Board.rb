require_relative 'ship'
require_relative 'destroyer'
require_relative 'cruiser'
require_relative 'battleship'
require_relative 'submarine'
require_relative 'carrier'

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

    if ship.direction == "V"
      for x in 0..ship.size-1
        grid[row+x][col] = "ship"
      end
    else
      for x in 0..ship.size-1
        grid[row][col+x] = "ship"
      end
    end
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