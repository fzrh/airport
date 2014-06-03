require './lib/plane'
require './lib/airport'
require './lib/weather'

describe 'The grand finale' do

  include Weather

  let (:plane) { Plane.new }
  let (:airport) { Airport.new }

  before do
  	airport.stub(:weather_condition).and_return('sunny')
  end

  it 'all planes can land and change status to "landed"' do
  	hangar = double :hangar
   	6.times {plane}
 	6.times {airport.give_permission_to_land_to plane}
 	expect(airport.planes_count).to eq 6
  	expect(6.times {plane.land!}).to be_true
  end

  it 'all planes can take off and change status to "flying"' do
  	hangar = double :hangar
  	6.times {plane}
  	6.times {airport.give_permission_to_take_off_to plane}
  	expect(airport.planes_count).to eq 0
  	expect(6.times {plane.status?}).to be_true
  end

end