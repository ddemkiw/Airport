  
require 'airport'
require 'airplane'


describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Airplane.new}


    context 'launching and landing' do

      before(:each) do allow(airport).to receive(:stormy_weather?) {false} end

      it 'a plane can land' do
        airport.land(plane)
      end

      it 'a plane can launch' do
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
      expect(lambda { airport.launch(plane) }).to raise_error(RuntimeError, 'No planes currently landed at airport')
      end
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

