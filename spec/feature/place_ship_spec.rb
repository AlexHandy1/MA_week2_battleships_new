require 'board'

feature "place a ship" do
  scenario "on the grid and check its position" do
    board = Board.new
    ship = Ship.new("A3")
    board.place ship
    expect(board.check_grid ship.position).to eq "ship"
  end
end