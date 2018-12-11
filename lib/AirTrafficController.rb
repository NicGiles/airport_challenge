require_relative 'Plane'
require_relative 'Weather'

class AirTrafficController
attr_reader :available_planes, :weather

HANGER_CAPACITY = 8

  def initialize(capacity = HANGER_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @available_planes = []
  end

  def land_plane_when_safe(plane)
    raise "You can't land in this Weather, Jack" if unsafe_weather?
    plane.land_plane_when_safe(self)
    @available_planes << plane
    "Plane is in the hanger"
  end

  def unsafe_weather?
    weather.unsafe_weather?
  end

end
