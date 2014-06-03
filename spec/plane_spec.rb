require 'plane'

describe Plane do

  let(:plane) {Plane.new}

  it 'has a flying status when created' do
    expect(plane.status?).to eq 'flying'
  end

  it 'changes its status to "flying" after taking off' do
    plane.take_off!
    expect(plane.status?).to eq 'flying'
  end

  it 'changes its status to "landed" after landing' do
    plane.land!
    expect(plane.status?).to eq 'landed'
  end

  it 'cannot land if it is already landed' do
    plane.land!
    expect(lambda {plane.land!}).to raise_error 'You are already landed!'
  end

end