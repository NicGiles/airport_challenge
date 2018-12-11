require 'Plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:hanger) { double :hanger }

  describe '#land_plane' do
    it { is_expected.to respond_to :land_plane }
    end

    it 'sticks landed plane in the hanger' do
      plane.land_plane(hanger)
      expect(plane.hanger).to eq hanger
    end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

end
