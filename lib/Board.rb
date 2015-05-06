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
    grid[row][col] = "ship"
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