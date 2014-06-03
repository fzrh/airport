require 'plane'

describe Plane do

  let(:plane) {Plane.new}

  it 'has a flying status when created' do
    expect(plane.status?).to eq 'flying'
    # expect(plane).to be_flying
  end

  it 'changes its status to "flying" after taking off' do
    plane.land!.take_off!
    expect(plane.status?).to eq 'flying'
  end

  xit 'can not take-off if it is already flying' do
    expect(plane.status?).to eq 'flying'
    expect{plane.take_off!}.to raise_error 'You are already in the air!'
  end

  it 'changes its status to "landed" after landing' do
    plane.take_off!.land!
    expect(plane.status?).to eq 'landed'
  end

  xit 'can not land if it is already landed' do
    expect(plane.status?).to eq 'flying'
    expect{plane.take_off!}.to raise_error 'You are already in the air!'
  end

end