require 'airport'
require 'weather'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'has maximum capacity' do
    expect(airport.capacity).to eq 10
  end   

  context 'traffic control' do

    before do
      airport.stub(:weather_condition).and_return('sunny')
    end

    it 'gives a plane permission to land' do
      airport.give_permission_to_land_to plane
      expect(airport.hangar).to include plane
      expect(plane.status?).to eq 'landed'
    end

    it 'gives a plane permission to take off' do
      airport.give_permission_to_take_off_to plane
      expect(airport.hangar).not_to include plane
      expect(plane.status?).to eq 'flying'
    end

    it 'knows when the airport is full' do
      expect(airport).not_to be_full
      airport.capacity.times {airport.give_permission_to_land_to plane}
      expect(airport).to be_full
    end

    it 'denies a landing request if the airport is full' do
      airport.capacity.times {airport.give_permission_to_land_to plane} 
      expect{airport.give_permission_to_land_to plane}.to raise_error 'Sorry, airport is full.'
    end

  end

  context 'traffic control when in a bad weather' do

    before do
      airport.stub(:weather_condition).and_return('stormy')
    end

    it 'wont let a plane take off' do
      expect{airport.give_permission_to_land_to plane}.to raise_error 'Sorry, permission to take off denied. The weather is stormy.'
    end
      
    it 'wont let a plane land' do
      expect{airport.give_permission_to_take_off_to plane}.to raise_error 'Sorry, permission to land denied. The weather is stormy.'
    end

  end

end