require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'changes its status to "landed" after landing' do
    plane.flying
    plane.landed
    expect(plane.landed).not_to be_flying
  end

  it 'changes its status to "flying" after taking of' do
    plane.landed
    plane.take_off!
    expect(plane.take_off!).to be_flying
  end

end