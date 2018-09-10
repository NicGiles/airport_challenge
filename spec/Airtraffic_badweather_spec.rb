require 'AirTrafficController'

#These tests check that planes are not allowed to take off or land in bad weather.

describe AirTrafficController do

  before(:each) do
    allow(Weather).to receive(:bad_weather).and_return(true)
  end

  it 'prevents landing in bad weather' do
    heathrow = AirTrafficController.new
    plane = Plane.new
    expect { plane.land_plane_when_safe }.to raise_error
#expect { plane.land_plane_when_safe(Plane.new) }.to raise_error
    #("You can't land in this Weather, Jack")
end


it 'prevents taking off in bad weather' do
  heathrow = AirTrafficController.new
  plane = Plane.new
  expect { plane.take_off_when_safe }.to raise_error
#expect { heathrow.take_off_when_safe }.to raise_error
#("You can't possibly fly that plane is this weather?")
end

# - Test not working

end
