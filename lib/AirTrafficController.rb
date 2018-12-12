require_relative 'Plane'
require_relative 'Weather'

class AirTrafficController
attr_reader :available_planes, :weather, :capacity

HANGER_CAPACITY = 8

  def initialize(weather = Weather.new, capacity = HANGER_CAPACITY)
    @capacity = HANGER_CAPACITY
    @weather = weather
    @available_planes = []
  end

  def land_plane_when_safe(plane)
    raise "You can't land in this Weather, Jack" if unsafe_weather?
    raise 'Sorry boss, no room in the inn' if full?
    @available_planes << plane
    plane.land_plane
    "Plane is in the hanger"
  end

  def take_off_when_safe(plane)
    raise "You fly boys, you crack me up" if unsafe_weather?
    raise 'No planes here' if empty?
    available_planes.pop
    plane.take_off
    "Plane is in the air"
  end

  private

  def unsafe_weather?
    weather.unsafe_weather?
  end

  def full?
    available_planes.length >= capacity
  end

  def empty?
    available_planes.length == 0
  end

end
