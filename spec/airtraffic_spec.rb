require 'AirTrafficController'

describe AirTrafficController do
  subject(:heathrow) { described_class.new(8, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#land_plane_when_safe' do
    context 'nice weather' do
      before do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end

      it 'confirms plane can land' do
        expect(plane).to receive(:land_plane_when_safe)
        heathrow.land_plane_when_safe(plane)
      end
    end
end
end
