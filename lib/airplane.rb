class Airplane

  def initialize
    taking_off!
  end

  def landing!
    raise "Plane is already landed" if !flying?
    @flying = false
  end

  def flying? 
    @flying
  end

  def taking_off!
    raise "Plane is already flying" if flying?
    @flying = true
  end

end