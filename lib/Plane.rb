class Plane

  attr_reader :in_the_air

  def initialize
    @in_the_air = true
  end

  def land_plane(plane)
    @in_the_air = false
  end

  def take_off(plane)
    @in_the_air = true
  end

end
