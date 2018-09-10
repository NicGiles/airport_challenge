require 'AirTrafficController'

describe AirTrafficController do

  before(:each) do
    allow(Weather).to receive(:bad_weather).and_return(false)
  end

  it 'raises an error when the airport is full' do
    expect { 9.times { subject.land_plane_when_safe(Plane.new) } }.to raise_error("We're full. You'll have to find another airport")
end

end
