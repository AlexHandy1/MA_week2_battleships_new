require 'board'

describe Board do
  it{is_expected.to respond_to(:place)}
  it{is_expected.to respond_to(:check_grid)}

  it "check that the grid exists" do
    expect(subject.grid.length).to eq 10
  end

  it "converts a square coords into array elements" do
    expect(subject.convertor("A3")).to eq [0,2]
  end
end