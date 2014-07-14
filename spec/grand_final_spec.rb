require './lib/plane'
require './lib/airport'
require './lib/weather'

describe 'The grand finale' do

  include Weather

  let (:plane) { Plane.new }
  let (:airport) { Airport.new }

  before do
    allow(airport).to receive(:weather_condition).and_return('sunny')
  	# airport.stub(:weather_condition).and_return('sunny')
  end

  it 'all planes can land and change status to "landed"' do
    planes = Array.new(airport.capacity) { Plane.new }
    planes.each do |plane|
      expect(plane.status?).to eq "flying"
      airport.give_permission_to_land_to plane
      expect(plane.status?).to eq "landed"
    end
  end

  it 'all planes can take off and change status to "flying"' do
    hangar = Array.new(airport.capacity) { Plane.new.land! }
    hangar.each do |plane|
      expect(plane.status?).to eq "landed"
      airport.give_permission_to_take_off_to plane
      expect(plane.status?).to eq "flying"
    end
  end

end