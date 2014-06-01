require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end
  
  it 'changes its status to "flying" after taking of' do
    plane.take_off
    allow(plane.take_off).to receive(:flying)
    plane.flying
  end

  it 'changes its status to "landed" after landing' do
    plane.flying
    allow(plane.flying).to receive(:landed)
    plane.landed
  end

end