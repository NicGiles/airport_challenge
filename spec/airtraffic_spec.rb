require 'AirTrafficController'

describe AirTrafficController do
  subject(:heathrow) { described_class.new(8, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#land_plane_when_safe' do
    context 'nice weather, plane capacity' do
      before do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end

      it 'confirms plane can land' do
        expect(plane).to receive(:land_plane_when_safe)
        heathrow.land_plane_when_safe(plane)
      end

      context 'prevents landing when at capacity' do
      it "tells pilot they can't land" do
        8.times do
          heathrow.land_plane_when_safe(plane)
        end
        expect { heathrow.land_plane_when_safe(plane) }.to raise_error 'Sorry boss, no room in the inn'
      end
    end
  end
end
end
