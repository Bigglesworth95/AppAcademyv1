require 'byebug'
class Card
  attr_reader :face_up, :face_value
  def initialize(value)
    @face_up = false
    @face_value = value
  end

  def display
    if @face_up == true
      @face_value
    else
      "X"
    end
  end

  def hide
    @face_up = false
    display
  end

  def reveal
    @face_up = true
    display
  end

  def to_s
    return face_value.to_s if @face_up == true
    "X"
  end

  def ==(value)
    @face_value == value
  end

end
