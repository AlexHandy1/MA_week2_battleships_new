require 'board'

feature "place a ship" do

  scenario "on the grid and check its position" do
    board = Board.new
    ship = Ship.new("A3")
    board.place ship
    expect(board.check_grid ship.position).to eq "ship"
  end

  scenario "that is a destoyer and check its position" do
    board = Board.new
    ship = Destroyer.new("A2")
    board.place ship
    expect(board.check_grid "A2").to eq "ship"
    expect(board.check_grid "A3").to eq "ship"
  end

  scenario "that is a Carrier and check its position" do
    board = Board.new
    ship = Carrier.new("B1")
    board.place ship
    expect(board.check_grid "B1").to eq "ship"
    expect(board.check_grid "B5").to eq "ship"
  end

  scenario "that is a destroyer and has a direction of vertical" do
    board = Board.new
    ship = Destroyer.new("A3", "V")
    board.place ship
    expect(board.check_grid "B3").to eq "ship"
    expect(board.check_grid "A3").to eq "ship"
  end
end

feature 'Cannot place a ship' do
  scenario 'where starts outside of the board' do
    board = Board.new
    ship = Ship.new("A11")
    expect { board.place ship }.to raise_error 'Out of bounds'
  end

  scenario 'that is horizontally outside the board' do
    board = Board.new
    ship = Cruiser.new("A9")
    expect {board.place ship}.to raise_error 'Out of bounds'
  end

  scenario 'that is vertically outside the board' do
    board = Board.new
    ship = Cruiser.new("I9")
    expect {board.place ship}.to raise_error 'Out of bounds'
  end

  scenario 'where there is already a ship' do
    board = Board.new
    ship = Submarine.new("A2")
    ship2 = Cruiser.new("A2")
    board.place ship
    expect {board.place ship2}.to raise_error "Already a ship"
  end

  scenario 'where they overlap' do
    board = Board.new
    ship = Submarine.new("A2")
    ship2 = Carrier.new("A1")
    board.place ship
    expect {board.place ship2}.to raise_error "Already a ship"
  end
end





