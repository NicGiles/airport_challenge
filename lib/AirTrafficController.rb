
require_relative 'Weather'

class AirTrafficController
attr_reader :available_planes, :weather, :capacity

HANGER_CAPACITY = 8

  def initialize(weather, capacity)
    @capacity = HANGER_CAPACITY
    @weather = weather
    @available_planes = []
  end

  def land_plane_when_safe(plane)
    raise "You can't land in this Weather, Jack" if unsafe_weather?
    raise 'Sorry boss, no room in the inn' if full?
    @available_planes << plane
    "Plane is in the hanger"
    plane.land_plane(self)
  end

  def take_off_when_safe(plane)
    available_planes.pop
    plane.take_off(self)
  end

  def unsafe_weather?
    weather.unsafe_weather?
  end

  def full?
    available_planes.length >= capacity
  end

end
