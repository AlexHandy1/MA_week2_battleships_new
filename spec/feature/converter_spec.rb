require 'converter'

shared_examples_for Converter do
  xit "converts an element of a ship position to a grid array index" do
    ship = instance_double("ship", :position => "A3", :direction => "H", :size => 2, :hits => 0, :all_blocks => 0, :floating => true)
    expect(subject.converter "A3").to eq 0,2
  end
end


class TestConverter; include Converter; end

xdescribe TestConverter do
  it_behaves_like Converter
  describe "The converter" do
    it "can convert a coordinate into grid array indexes" do
      expect(subject.converter "A3").to eq 0,2
    end
  end
end