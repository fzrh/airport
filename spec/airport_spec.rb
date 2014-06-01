require 'airport'
require 'weather'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'has maximum capacity' do
    expect(airport.capacity).to eq 25
  end   

  context 'traffic control' do

    before do
      airport.stub(:weather_condition).and_return('sunny')
    end

    it 'gives a plane permission to land' do
      airport.gives_permission_to_land_to plane
      expect(airport.hangar).to include plane
    end

    it 'gives a plane permission to take off' do
      airport.gives_permission_to_take_off_to plane
      expect(airport.hangar).not_to include plane
    end

    it 'knows when the airport is full' do
      expect(airport).not_to be_full
      25.times {airport.gives_permission_to_land_to plane}
      expect(airport).to be_full
    end

    it 'denies a landing request if the airport is full' do
      airport.capacity.times {airport.gives_permission_to_land_to plane} 
      expect{ airport.gives_permission_to_land_to plane }.to raise_error RuntimeError
    end

  end

  context 'traffic control (bad weather)' do

    before do
      airport.stub(:weather_condition).and_return('stormy')
    end

    it 'wont let a plane take off in a stormy weather' do
      expect{ airport.gives_permission_to_land_to plane }.to raise_error RuntimeError
    end
      
    it 'wont let a plane land in the middle of a storm' do
      expect{ airport.gives_permission_to_take_off_to plane }.to raise_error RuntimeError
    end

  end

end