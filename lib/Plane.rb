class Plane

  attr_reader :in_the_air

  def initialize
    @in_the_air = true
  end

  def land_plane
    @in_the_air = false
  end

  def take_off
    @in_the_air = true
  end

end
