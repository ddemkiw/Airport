require_relative 'airport'
require_relative 'airplane'

class Airport

  DEFAULT_CAPACITY = 10

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
  raise "Airport is full" if full?
  plane.landing!
  planes << plane
end

def full?
  plane_count == DEFAULT_CAPACITY
end


end