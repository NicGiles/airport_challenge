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

  context 'nasty weather, plane capacity' do
    before do
      allow(weather).to receive(:unsafe_weather?).and_return true
    end

    it 'prevents plane landing' do
      expect { heathrow.land_plane_when_safe(plane) }.to raise_error "You can't land in this Weather, Jack"
    end
  end


  describe '#take_off_when_safe' do
    context 'nice weather, plane in air' do
      before do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end

      it 'allows plane to land, then allows on to take off' do
        heathrow.land_plane_when_safe(plane)
        expect((subject.available_planes).length).to eq 1
        heathrow.take_off_when_safe(plane)
        expect((subject.available_planes).length).to eq 0
      end
    end

    context 'nice weather but no planes' do
      before do
        allow(weather).to receive(:unsafe_weather?).and_return false
      end
      it 'prevents plane landing' do
        expect { heathrow.take_off_when_safe(plane) }.to raise_error "No planes here"
      end
  end

  context 'nasty weather, planes available' do
    before do
      allow(weather).to receive(:unsafe_weather?).and_return true
    end

    it 'prevents plane taking off if windy' do
      expect { heathrow.take_off_when_safe(plane) }.to raise_error "You fly boys, you crack me up"
    end
  end

end

end
