require 'Plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land_plane' do
    it { is_expected.to respond_to :land_plane }
    end

    it "landed plane isn't in the air" do
      plane.land_plane
      expect(plane.in_the_air).to eq false
    end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

  it 'sticks landed plane in the hanger' do
    plane.take_off
    expect(plane.in_the_air).to eq true
  end

end
