  
require 'airport'
require 'airplane'


describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Airplane.new}


    context 'launching and landing' do

      it 'a plane can land' do
        allow(airport).to receive(:stormy_weather?) {false}
        airport.land(plane)
      end

      it 'a plane can launch' do
        allow(airport).to receive(:stormy_weather?) {false}
        airport.land(plane)  
        airport.launch(plane)
        expect(airport.plane_count).to eq(0)
      end

    end

    context 'traffic control' do

      it 'a plane cannot land if the airport is full' do
        allow(airport).to receive(:stormy_weather?) {false}
        6.times { airport.land(Airplane.new) }
        expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, 'Airport is full')
      end

      it 'a plane cannot be launched from an empty airport' do
      p airport
      expect(lambda { airport.launch(plane) }).to raise_error(RuntimeError, 'No planes currently landed at airport')
      end

    context 'weather conditions' do

      it 'a plane cannot launch when there is a storm brewing' do
        allow(airport).to receive(:stormy_weather?) {true}
        expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, "a plane cannot land if the weather is stormy")
      end

      it 'a plane cannot land in the middle of a storm' do
        airport.land(plane)
        allow(airport).to receive(:stormy_weather?) {true}
        expect(lambda { airport.launch(plane) }).to raise_error(RuntimeError, "a plane cannot launch if the weather is stormy")
      end

    end
  end
end

describe Airplane do

  let(:plane) { Airplane.new }

  it 'should have a flying status when created' do 
    expect(plane).to be_flying
  end

  it 'should be able to land' do
    plane.landing!
    expect(plane).not_to be_flying
  end

  it 'should be able to launch' do
    plane.landing!
    plane.taking_off!
    expect(plane).to be_flying
  end

  it 'should change its status to flying after launch' do
    plane.landing!
    expect(plane).not_to be_flying
    plane.taking_off!
    expect(plane).to be_flying
  end

  it 'a plane cannot take off if it is already flying' do 
    expect(lambda { plane.taking_off! }).to raise_error(RuntimeError, 'Plane is already flying')
  end

  it 'a plane cannot land if it is not flying' do
    plane.landing!
    expect(lambda { plane.landing! }).to raise_error(RuntimeError, 'Plane is already landed')
  end
end

