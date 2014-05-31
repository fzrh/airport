require './lib/airport'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land.

describe Airport do

  let(:airport) { Airport.new }

  context 'has maximum capacity' do

    it "by default" do
      expect(airport.capacity).to eq 25
    end   
  end

  context "traffic control tower" do

    it "gives a plane permission to land" do

      plane = double :plane
      airport.gives_permission_to_land_to(plane)
      expect(airport.hangar).to include plane
    end
  end
end