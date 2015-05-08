require 'board'

describe Board do
  it{is_expected.to respond_to(:place)}
  it { is_expected.to respond_to(:fire).with(1).argument }

  it "check that the grid exists" do
    expect(subject.grid.length).to eq 10
  end

  it "converts a square coords into array elements" do
    expect(subject.converter("A3")).to eq [0,2]
  end

  it "converts square coords that are double figures into array elements" do
    expect(subject.converter("B10")).to eq [1,9]
  end

end