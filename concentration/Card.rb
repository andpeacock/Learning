class Card
  attr_reader :value, :face_down
  def initialize(value)
    @value = value
    @face_down = true
  end
  def face_down=(fd)
    @face_down = fd
  end
end