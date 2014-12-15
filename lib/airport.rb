require_relative 'airplane'
require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 6

  def initialize 
    capacity = DEFAULT_CAPACITY
  end

  def planes
    @planes ||= []
  end

  def landed_planes
    @planes
  end

  def plane_count
    planes.count
  end

  def land(plane)
    landing_errors(plane)
    plane.landing!
    planes << plane
  end

  def launch(plane)
    launching_errors
    plane.taking_off!
    planes.delete(plane)
  end

  def full?
    plane_count == DEFAULT_CAPACITY
  end

  def airport_empty?
    plane_count <= 0
  end
  
  def launching_errors
    raise "No planes currently landed at airport" if airport_empty?
    raise "a plane cannot launch if the weather is stormy" if stormy_weather? 
  end

  def landing_errors(plane)
    raise "a plane cannot land if the weather is stormy" if stormy_weather? 
    raise "Airport is full" if full?
  end



end