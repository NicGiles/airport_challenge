require 'AirTrafficController'

describe AirTrafficController do
  subject(:heathrow) { described_class.new(weather, 8) }
  let(:plane) { double :plane, land_plane: nil, take_off: nil }
  let(:weather) { double :weather }

  describe '#land_plane_when_safe' do
    context 'nice weather, plane capacity' do
      before do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end

      it 'confirms plane can land' do
        expect(plane).to receive(:land_plane)
        heathrow.land_plane_when_safe(plane)
      end
    end
  end

  describe '#land_plane_when_safe' do
    context 'nice weather, plane capacity' do
      before(:each) do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end
      it "tells pilot they can't land when full" do
              8.times do
                heathrow.land_plane_when_safe(plane)
              end
              expect { heathrow.land_plane_when_safe(plane) }.to raise_error 'Sorry boss, no room in the inn'
            end
end
end
end
