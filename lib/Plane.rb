class Plane

  attr_reader :in_the_air

  def initialize
    @in_the_air = true
  end

  def land_plane
    raise "Hold on, that plane is already in the hanger" if in_hanger?
    @in_the_air = false
  end

  def take_off
    @in_the_air = true
  end

  private

  def in_hanger?
    @in_the_air == false
  end

end
