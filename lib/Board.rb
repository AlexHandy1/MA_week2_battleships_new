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
    fail 'Out of bounds' if row > 9 || col > 9
    fail "Already a ship" if grid[row][col] == "ship"

    if ship.direction == "V"
      for x in 0..ship.size-1
        if row+x > 9 || col > 9
          grid[row+x-1][col] = nil
          fail 'Out of bounds'
        end
        if grid[row+x][col] == "ship"
          grid[row+x-1][col] = nil
          fail 'Already a ship'
        end
        grid[row+x][col] = "ship"
      end
    else
      for x in 0..ship.size-1
        if row > 9 || col+x > 9
          grid[row][col+x-1] = nil
          fail 'Out of bounds'
        end
        if grid[row][col+x] == "ship"
          grid[row][col+x-1] = nil
          fail 'Already a ship'
        end
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
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def show_grid
    grid.each { |x| p x }
  end

  # def out_of_bounds?(square)
  # #   row, col = convertor(square)
  #   return true if row > 10 || col > 10
  # end

end