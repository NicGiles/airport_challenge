require 'Plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land_plane' do
    it { is_expected.to respond_to :land_plane }

    it "upon landing changes state of plane to grounded" do
      plane.land_plane
      expect(plane.in_the_air).to eq false
    end

    it "prevents a plane from landing twice" do
      plane.land_plane
      expect(plane.in_the_air).to eq false
      expect { plane.land_plane }.to raise_error "Hold on, that plane is already in the hanger"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'changes plane state to flying upon take off' do
      plane.land_plane
      plane.take_off
      expect(plane.in_the_air).to eq true
    end

    it 'prevents a plane from taking off twice' do
      plane.land_plane
      plane.take_off
      expect { plane.take_off }.to raise_error "Hold on, that plane is already in the air"
    end
  end
end
