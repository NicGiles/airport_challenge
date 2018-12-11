require 'Weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#bad_weather?' do
    it 'is sometimes nice' do
      allow(weather).to receive(:rand).and_return 2
      expect(weather.unsafe_weather?).to be false
    end
  end

  describe '#bad_weather?' do
    it 'is sometimes nasty' do
      allow(weather).to receive(:rand).and_return 5
      expect(weather.unsafe_weather?).to be true
    end
  end


end
