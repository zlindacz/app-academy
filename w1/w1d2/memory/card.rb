class Card

  attr_accessor :face_up
  attr_reader :face_value

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def display
    if @face_up
      @face_value
    else
      "X"
    end
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(another_card)
    @face_value == another_card.face_value
  end
end
