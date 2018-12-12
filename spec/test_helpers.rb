
def good_weather
  allow(weather).to receive(:unsafe_weather?).and_return false
end

def bad_weather
  allow(weather).to receive(:unsafe_weather?).and_return true
end
