require 'Board'

describe Board do
  it{is_expected.to respond_to(:place)}
  it{is_expected.to respond_to(:check_grid)}

  it "check that the grid exists" do
    expect(subject.grid).to eq true
  end

end