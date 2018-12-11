class Plane

  attr_reader :in_the_air

  def initialize
    @in_the_air = true
  end

  def land_plane(hanger)
    @in_the_air = false
    @hanger = hanger
  end

  def take_off
    @in_the_air = true
  end

  def hanger
    @hanger
  end



end
