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

end