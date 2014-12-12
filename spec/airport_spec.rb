require './lib/airport.rb'

describe Airport do
  
  let(:airport) {Airport.new}
  let(:plane) {double :plane}


  it "should ground planes that land" do
    expect(plane).to receive(:landing!)
    airport.land(plane)
  end

  it "should keep track of the landed planes" do
     allow(plane).to receive(:landing!)
    expect{airport.land(plane)}.to change{airport.plane_count}.from(0).to(1)
  end


  it "should know when it's full" do
    allow(plane).to receive(:landing!) 
    expect(airport).not_to be_full
    10.times {airport.land(plane)}
    expect(airport).to be_full
  end

   it "should not accept a plane if it's full" do
    10.times { airport.land(plane) }
    expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, 'Sorry! No more room for planes')
  end

end

