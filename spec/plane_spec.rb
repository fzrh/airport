require 'plane'

describe Plane do

  let(:plane) {Plane.new}

  it 'has a flying status when created' do
    expect(plane.status?).to eq 'flying'
  end

  # it 'has a flying status when in the air' do
  #   plane.take_off!
  #   expect(plane.status?).to eq 'flying'
  # end

  it 'changes its status to "flying" after taking off' do
    plane.landed!.take_off!
    expect(plane.status?).to eq 'flying'
  end

  it 'changes its status to "landed" after landing' do
    plane.take_off!.landed!
    expect(plane.status?).to eq 'landed'
  end

end