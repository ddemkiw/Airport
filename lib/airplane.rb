class Airplane

  def initialize
    taking_off!
  end
 
  def landing!
    @flying = false
  end

  def flying? 
    @flying
  end

  def taking_off!
    @flying = true
  end

end