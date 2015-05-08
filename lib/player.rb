require_relative 'board'
require_relative 'converter'

class Player
  include Converter
attr_accessor :my_board, :my_shots_board, :attempts, :opponent
  def initialize
    @my_board = yield
    @my_shots_board = yield
    @attempts = []
    @opponent = nil
  end

  def place_my_ship ship
    my_board.place ship
  end

  def receive_fire square
    my_board.fire square
  end

  def fire_at_opponent square
    opponent.my_board.fire square
    my_shots_board.fire square
    #will just track X's not where a HIT
    @attempts << square
  end

  def show_my_whole_grid
    my_board.grid.each { |x| p x }
  end

  def check_my_grid_square square
    row, col = my_board.converter(square)
    my_board.grid[row][col]
  end

  def check_my_shots square
    row, col = my_board.converter(square)
    my_shots_board.grid[row][col]
  end

  def show_my_shots_grid
    my_shots_board.grid.each { |x| p x}
    puts "you have taken #{@attempts.length} shots"
  end

  def you_win
    return "You win" if opponent.my_board.game_over?
    #methods don't work yet - need to link to grid
    # puts "Lets clear the boards and start again"
    # my_board.clear_board
    # my_board.my_shots_board.clear_board
    # opponent.my_board.clear_board
    # opponent.my_shots_board.clear_board
  end
end