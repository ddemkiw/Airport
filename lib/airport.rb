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

  def plane_count
    planes.count
  end

  def land(plane)
    raise "a plan cannot land if the weather is stormy" if stormy_weather? 
    raise "Airport is full" if full?
    plane.landing!
    planes << plane
  end

  def take_off(plane)
    raise "a plan cannot take off if the weather is stormy" if stormy_weather? 
    raise "No planes currently landed at airport" if airport_empty?
    plane.taking_off!
    planes.delete(plane)
  end

  def full?
    plane_count == DEFAULT_CAPACITY
  end


  def airport_empty?
    plane_count <= 0
  end


end