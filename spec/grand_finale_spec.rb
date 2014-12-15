
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

  let(:airport) {Airport.new}
  let(:plane)  {double :plane} 

  it 'all planes can land' do
    allow(plane).to receive(:landing!)
    airport.land(plane)
    expect(airport.plane_count).to eq(1)
  end


  it 'all planes can take off' do
    allow(plane).to receive(:landing!)
    allow(plane).to receive(:taking_off!)
    allow(airport).to receive(:stormy_weather?) {false}
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.plane_count).to eq(0)
  end

end