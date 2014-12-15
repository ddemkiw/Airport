
# grand finale
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

require 'airport'
require 'airplane'



describe "The grand finale (last spec)" do

  let(:airport) {Airport.new}
  let(:plane) {Airplane.new}

  before(:each) do allow(airport).to receive(:stormy_weather?) {false} end

  context "land six planes" do 

    it 'all planes can land' do
      land_6_planes
      expect(airport.landed_planes.count).to eq(6)
    end

    it "planes should not be flying after landing" do
      land_6_planes
      expect(airport.landed_planes.map{|plane|plane.flying?}.uniq).to eq [false]
    end

  end

  context "launch six planes" do
   
    it 'all planes can launch' do
    launch_6_planes
    expect(airport.landed_planes.count).to eq(0)
    end

    it "planes should be flying after take_off" do
      planes = []
      6.times{planes << Airplane.new}
      planes.each {|plane| airport.land(plane)}
      planes.each {|plane| airport.launch(plane)}
      expect(planes.map{|plane|plane.flying?}.uniq).to eq [true]
    end

end

#Helper methods

  def land_6_planes
    planes = []
    6.times{planes << Airplane.new}
    planes.each {|plane| airport.land(plane)}
  end

  def launch_6_planes
    planes = []
    6.times{planes << Airplane.new}
    planes.each {|plane| airport.land(plane)}
    planes.each {|plane| airport.launch(plane)}
  end
end