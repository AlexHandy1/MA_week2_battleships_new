require_relative 'board'

class Player
attr_accessor :pl_board, :op_board, :attempts
  def initialize
    @pl_board = yield
    @op_board = yield
    @attempts = []
  end

  def place_my_ship ship
    pl_board.place ship
  end

  def receive_fire square
    pl_board.fire square
  end

  def fire_at_opponent square
    op_board.fire square
    #consider adding evaluate to square that can pass to opponent interface
    @attempts << square
  end

  def show_my_whole_grid
    pl_board.grid.each { |x| p x }
  end

  def check_my_grid_square square
    row, col = pl_board.convertor(square)
    pl_board.grid[row][col]
  end

  def check_my_shots square
    op_board.grid[row][col]
  end

  def show_my_shots_grid
    op_board.grid.each { |x| p x}
    puts "you have taken #{@attempts.length} shots"
  end
end