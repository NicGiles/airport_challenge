require_relative '../lib/Plane'
require_relative '../lib/Weather'

class AirTrafficController
attr_reader :hanger, :weather

HANGER_CAPACITY = 8

  def initialize(capacity = HANGER_CAPACITY, weather = Weather.new)
    @hanger = []
    @capacity = capacity
    @weather = weather

  end

  def take_off_when_safe
    raise "You can't possibly fly that plane is this weather?" if @weather.bad_weather
    @hanger.pop
    "Plane is in the air"
  end

  def land_plane_when_safe(plane)
    raise "You can't land in this Weather, Jack" if @weather.bad_weather
    raise "We're full. You'll have to find another airport" if full?
    @hanger << plane
    "Plane is in the hanger"
  end

  def full?
    @hanger.length >= @capacity
  end

end
