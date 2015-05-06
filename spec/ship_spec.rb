require 'ship'

describe Ship do
  it "has a start position" do
    ship = Ship.new "A2"
    expect(ship.position).to eq "A2"
  end

  it "has 2 spaces as a Destroyer" do
    ship = Destroyer.new "A2"
    expect(ship.size).to eq 2
  end

  it 'has 5 spaces as a Carrier' do
    ship = Carrier.new "B1"
    expect(ship.size).to eq 5
  end
end