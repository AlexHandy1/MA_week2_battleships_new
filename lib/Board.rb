require_relative 'ship'
require_relative 'destroyer'
require_relative 'cruiser'
require_relative 'battleship'
require_relative 'submarine'
require_relative 'carrier'
require_relative 'converter'


class Board
  include Converter
  attr_accessor :grid, :guesses, :fleet, :ship_positions, :game_over

  def initialize(size = 10)
    @grid = Array.new(size){Array.new(size)}
    @fleet = []
    @guesses = []
    @game_over = false
  end

  def place ship #consider reword to place_ship
    row, col = converter(ship.position)
    fail 'Out of bounds' if out_of_bounds?(row, col)
    fail "Already a ship" if grid[row][col].nil? == false

    #not DRY or SRP >> how refactor into block/ proc?
    if ship.direction == "V"
      for x in 0..ship.size-1
        if row+x > 9 || col > 9
          grid[row+x-1][col] = nil
          fail 'Out of bounds'
        end
        if grid[row+x][col].nil? == false
          grid[row+x-1][col] = nil
          fail 'Already a ship'
        end
        grid[row+x][col] = ship
      end
        @fleet << ship
    else
      for x in 0..ship.size-1
        if row > 9 || col+x > 9
          grid[row][col+x-1] = nil
          fail 'Out of bounds'
        end
        if grid[row][col+x].nil? == false
          grid[row][col+x-1] = nil
          fail 'Already a ship'
        end
        grid[row][col+x] = ship
      end
        @fleet << ship
    end
  end

  def check_grid square #consider reword/ removal >> SHOW_CELL >> NOT its responsibility
     row, col = converter(square)
     grid[row][col]
  end

  def fire square #consider reword >> receive_hit
    row, col = converter(square)

    if grid[row][col] == nil
      puts "Unlucky you missed"
      grid[row][col] = "X"
    elsif grid[row][col].nil? == false && grid[row][col] != "X" && grid[row][col] != "HIT"
      #How distill this out into a block/ proc?
      fleet.each do |ship|
        if ship == grid[row][col]
          puts "You hit a ship!"
          grid[row][col].is_hit
          grid[row][col] = "HIT"
          ship.is_sunk
          game_over?
        end
      end
    else
      fail "Already guessed"
    end
  end

  def out_of_bounds?(row, col)
    row > 9 || col > 9
  end

  def game_over? #shouldn't be in board class >> move to a game
    if fleet.all?{|ship| ship.sunk?}
      game_over = true
      puts "You win!"
    end
    game_over
  end

  #added clear_board to start new game
  def clear_board
     grid.map!{|a,b,c,d,e,f,g,h,i,j| a,b,c,d,e,f,g,h,i,j = nil, nil, nil, nil,nil, nil, nil, nil, nil, nil }
     #would also need to empty fleet
  end
end