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

  scenario 'and when a ship is hit it can register a hit' do
    board = Board.new
    ship = Ship.new "A3"
    board.place ship
    board.fire("A3")
    expect(ship.hits).to eq 1
  end

  scenario 'and when a ship is hit it can register a hit other than on its starting point' do
    board = Board.new
    ship = Destroyer.new "A3"
    board.place ship
    board.fire("A4")
    expect(ship.hits).to eq 1
  end

  scenario 'when vertical ship is hit, it registers a hit other than on starting point' do
    board = Board.new
    ship = Destroyer.new "A3", "V"
    board.place ship
    board.fire("B3")
    expect(ship.hits).to eq 1
  end

  scenario 'when a ship is hit more than its lengh it sinks' do
    board = Board.new
    ship = Destroyer.new "A3"
    board.place ship
    board.fire("A3")
    board.fire("A4")
    expect(ship).to_not be_floating
  end

  scenario 'when all the ships have been sunk the game is over' do
    board = Board.new
    ship = Destroyer.new "A3"
    board.place ship
    board.fire("A3")
    board.fire("A4")
    expect(ship).to_not be_floating
    expect(board.game_over?).to be_truthy
  end

end





