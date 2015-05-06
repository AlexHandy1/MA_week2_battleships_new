require 'board'

feature 'A player can fire' do
  scenario 'and miss' do
    board = Board.new
    board.fire("A3")
    expect(board.check_grid("A3")).to eq "X"
  end

  scenario 'and hit a ship' do
    board = Board.new
    ship = Submarine.new("A3")
    board.place ship
    board.fire("A3")
    expect(board.check_grid("A3")).to eq "HIT"
  end

  scenario 'but cannot fire again on the same square' do
    board = Board.new
    board.fire("A3")
    expect { board.fire("A3") }.to raise_error 'Already guessed'
  end
end