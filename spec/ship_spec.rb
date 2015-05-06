require 'ship'
require 'carrier'
require 'destroyer'
require 'submarine'

describe Ship do
  it "has a start position" do
    ship = Ship.new "A2"
    expect(ship.position).to eq "A2"
  end

  it 'has 1 space as a Submarine' do
    ship = Submarine.new "A2"
    expect(ship.size).to eq 1
  end

  #ADD FURTHER TESTS FOR SPACES
  context "Destroyer" do
    it "has 2 spaces" do
      ship = Destroyer.new "A2"
      expect(ship.size).to eq 2
    end

    it "it has a direction of vertical" do
      ship = Destroyer.new "A2", "V"
      expect(ship.direction).to eq "V"
    end
  end

  it 'has 5 spaces as a Carrier' do
    ship = Carrier.new "B1"
    expect(ship.size).to eq 5
  end
end