# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

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
 	6.times {airport.gives_permission_to_land_to plane}
  	expect(6.times {plane.landed}).to be_true
  end

    it 'all planes can take off and change status to "flying"' do
  	hangar = double :hangar
   	6.times {plane}
 	6.times {airport.gives_permission_to_take_off_to plane}
  	expect(6.times {plane.flying?}).to be_true
  end

end