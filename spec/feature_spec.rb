require 'test_helpers'

describe 'Feature Test' do
  let(:airport) { AirTrafficController.new(weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'nice weather' do
    before do
      good_weather
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'allows planes to land and confirms' do
      expect(airport.land_plane_when_safe(plane)).to eq "Plane is in the hanger"
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it 'allows available planes to take off and confirms' do
      airport.land_plane_when_safe(plane)
      expect(airport.take_off_when_safe(plane)).to eq "Plane is in the air"
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it "tells pilot they can't land when full" do
      new_planes = []
      AirTrafficController::HANGER_CAPACITY.times { new_planes << Plane.new }
      new_planes.each { |current_plane| airport.land_plane_when_safe(current_plane) }
      expect { airport.land_plane_when_safe(plane) }.to raise_error 'Sorry boss, no room in the inn'
    end



  end

  context 'particularly nasty weather' do
    before do
      bad_weather
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
    it 'prevents landing in bad weather' do
      expect { airport.land_plane_when_safe(plane) }.to raise_error "You can't land in this Weather, Jack"
    end
  end

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

  context 'nice weather so the plane can land, but then a storm sets in and no planes are allowed to leave. Because of the storm.' do

    it 'prevents take off in bad weather' do
      good_weather
      airport.land_plane_when_safe(plane)
      expect(airport.available_planes.length).to eq 1
      bad_weather
      expect { airport.take_off_when_safe(plane) }.to raise_error "You fly boys, you crack me up"
    end

  end
end
