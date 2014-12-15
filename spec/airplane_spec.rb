require 'airplane'

describe Airplane do

  let(:plane) { Airplane.new }

  
  it 'should have a flying status when created' do 
    expect(plane).to be_flying
  end

  context 'launching and landing' do
    
    before(:each) do plane.landing! end
    
    it 'should be able to land' do
      expect(plane).not_to be_flying
    end

    it 'should not be flying after landing' do
      expect(plane).not_to be_flying
    end
    
    it 'should be able to launch' do
      plane.taking_off!
      expect(plane).to be_flying
    end

    it 'should be flying after taking off' do
      plane.taking_off!
      expect(plane).to be_flying
    end
  end

  context 'traffic control' do
    
    it 'a plane cannot take off if it is already flying' do 
      expect(lambda { plane.taking_off! }).to raise_error(RuntimeError, 'Plane is already flying')
    end

    it 'a plane cannot land if it is not flying' do
      plane.landing!
      expect(lambda { plane.landing! }).to raise_error(RuntimeError, 'Plane is already landed')
    end
  end
end