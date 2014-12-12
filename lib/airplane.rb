class Airplane

  def initialize
    take_off!
  end
 
  def landing!
    @flying = false
  end

  def flying? 
    @flying
  end

  def take_off!
    @flying = true
  end

end