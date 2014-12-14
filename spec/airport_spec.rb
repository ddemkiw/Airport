  
require 'airport'
require 'airplane'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Airplane.new}


    context 'taking off and landing' do

      it 'a plane can land' do
        allow(airport).to receive(:stormy_weather?) {false}
        airport.land(plane)
      end

      it 'a plane can take off' do
        allow(airport).to receive(:stormy_weather?) {false}
        airport.land(plane)  
        airport.take_off(plane)
      end
    end

    context 'traffic control' do

      it 'a plane cannot land if the airport is full' do
        allow(airport).to receive(:stormy_weather?) {false}
        6.times { airport.land(Airplane.new) }
        expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, 'Airport is full')
      end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy_weather?) {true}
        expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, "a plan cannot land if the weather is stormy")
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy_weather?) {true}
        expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, "a plan cannot land if the weather is stormy")
      end
    end
  end
end

# # When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
# #
# # When we land a plane at the airport, the plane in question should have its status changed to "landed"
# #
# # When the plane takes of from the airport, the plane's status should become "flying"

 describe Airplane do

   let(:plane) { Airplane.new }

    it 'has a flying status when created' do
      expect(plane).to be_flying
    end

    it 'has a flying status when in the air' do
      plane.taking_off!
      expect(plane).to be_flying
    end

    it 'can take off' do
      plane.landing!
      plane.taking_off!
      expect(plane).to be_flying
    end

    it 'changes its status to flying after taking of' do
      plane.landing!
      expect(plane).not_to be_flying
      plane.taking_off!
      expect(plane).to be_flying
    end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

  let(:airport) {Airport.new}
  let(:plane) {Airplane.new}

  it 'all planes can land' do
    allow(airport).to receive(:stormy_weather?) {false}
    6.times { airport.land(Airplane.new) }
    expect(airport.plane_count).to eq(6)
  end

  it 'all planes can take off' do
    allow(airport).to receive(:stormy_weather?) {false}
    6.times {airport.land(Airplane.new) }
    6.times {airport.take_off(plane) }
    expect(airport.plane_count).to eq(0)
  end

end
