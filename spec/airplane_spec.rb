require 'airplane'


describe Airplane do

let(:plane) {Airplane.new}

  it "should be flying" do
    :plane  
    expect(plane).to be_flying
  end

  it "should be able to land" do
    plane.land!
    expect(plane).not_to be_flying
  end

  it "should be able to take off" do
    plane.land!
    plane.take_off!
    expect(plane).to be_flying
  end

end