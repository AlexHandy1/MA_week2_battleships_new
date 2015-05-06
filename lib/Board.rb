require_relative 'ship'
require_relative 'destroyer'
require_relative 'cruiser'
require_relative 'battleship'
require_relative 'submarine'
require_relative 'carrier'
require 'byebug'

class Board

  attr_accessor :grid, :guesses, :fleet, :ship_positions

  def initialize(size = 10)
    @grid = Array.new(size){Array.new(size)}
    @fleet = []
    @guesses = []
    @ship_positions = []
  end

  def place ship
    row, col = convertor(ship.position)
    fail 'Out of bounds' if out_of_bounds?(row, col)
    fail "Already a ship" if already_a_ship?(row, col)

    if ship.direction == "V"
      for x in 0..ship.size-1
        if row+x > 9 || col > 9
          grid[row+x-1][col] = nil
          fail 'Out of bounds'
        end
        if already_a_ship?(row+x,col)
          grid[row+x-1][col] = nil
          fail 'Already a ship'
        end
        grid[row+x][col] = "ship"
      end
      @fleet << ship
    else
      for x in 0..ship.size-1
        if row > 9 || col+x > 9
          grid[row][col+x-1] = nil
          fail 'Out of bounds'
        end
        if already_a_ship?(row, col+x)
          grid[row][col+x-1] = nil
          fail 'Already a ship'
        end
        grid[row][col+x] = "ship"
      end
        ship.all_blocks = [ship.position]
        (ship.size - 1).times {ship.all_blocks << ship.all_blocks.last.next}
      @fleet << ship
    end
  end

  def check_grid square
     row, col = convertor(square)
     grid[row][col]
  end

  def fire square
    row, col = convertor(square)
    if grid[row][col] == "ship"
      grid[row][col] = "HIT"

      fleet.each do |ship|
        ship.all_blocks.each do |x|
          if x == square
            ship.is_hit
          end
        end
      end

    elsif grid[row][col] == nil
      grid[row][col] = "X"
    else
      fail "Already guessed"
    end
  end

  def convertor square
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def show_grid
    grid.each { |x| p x }
  end

  def out_of_bounds?(row, col)
    row > 9 || col > 9
  end

  def already_a_ship?(row, col)
    grid[row][col] == "ship"
  end

end