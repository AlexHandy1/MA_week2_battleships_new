require 'player'
require 'board'

describe Player do
  it "can create its own board" do
    player = Player.new {Board.new}
    expect(player.my_board).to be_instance_of Board
  end

  it "can put a ship on its own board and check position" do
    player = Player.new {Board.new}
    ship = instance_double("ship", :position => "A3", :direction => "H", :size => 2, :hits => 0, :all_blocks => 0, :floating => true)
    player.place_my_ship ship
    expect(player.check_my_grid_square "A3").to eq ship
  end

  it "can receive fire on its own board" do
    player = Player.new {Board.new}
    ship = instance_double("ship", :position => "A3", :direction => "H", :size => 2, :hits => 0, :all_blocks => 0, :floating => true)
    allow(ship).to receive(:is_hit)
    allow(ship).to receive(:is_sunk)
    allow(ship).to receive(:sunk?).and_return(true)
    player.place_my_ship ship
    player.receive_fire "A3"
    expect(player.check_my_grid_square "A3").to eq "HIT"
  end
end