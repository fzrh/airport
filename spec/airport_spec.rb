require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

  let(:airport) { Airport.new }

  it 'has maximum capacity' do
    expect(airport.capacity).to eq 25
  end   

  context 'traffic control' do

    it 'gives a plane permission to land' do
      plane = double :plane
      airport.gives_permission_to_land_to plane
      expect(airport.hangar).to include plane
    end

    it 'gives a plane permission to take off' do
      plane = double :plane
      airport.gives_permission_to_take_off_to plane
      expect(airport.hangar).to eq []
    end

    it 'knows when the airport is full' do
      plane = double :plane
      airport.stub(:weather_condition).and_return('sunny')
      expect(airport).not_to be_full
      25.times {airport.gives_permission_to_land_to plane}
      expect(airport).to be_full
    end

    it 'denies a landing request if the airport is full' do
      plane = double :plane
      airport.stub(:weather_condition).and_return('sunny')
      airport.capacity.times {airport.gives_permission_to_land_to plane} 
      expect{ airport.gives_permission_to_land_to plane }.to raise_error RuntimeError
    end

    it 'wont let a plane take off in a stormy weather' do
      plane = double :plane
      airport.stub(:weather_condition).and_return('stormy')
      expect{ airport.gives_permission_to_land_to plane }.to raise_error RuntimeError
    end
      
    it 'wont let a plane land in the middle of a storm' do
      plane = double :plane
      airport.stub(:weather_condition).and_return('stormy')
      expect{ airport.gives_permission_to_take_off_to plane }.to raise_error RuntimeError
    end

  end

end