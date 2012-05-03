class Card
  attr_accessor :value, :face_down
  def initialize(value)
    @value = value
    @face_down = false
  end
  def turn_over
    @face_down = !@face_down
  end
  
  def []=(v)
    @value = v
  end
  
  def to_s
    if face_down
      " * "
    else
      " #{@value} "
    end
  end
end
