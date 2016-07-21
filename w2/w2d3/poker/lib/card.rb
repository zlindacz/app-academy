class Card
  attr_accessor :suit, :face_value

  def initialize(face_value, suit)
    @face_value = face_value
    @suit = suit
  end

  def to_s
    suits= {hearts: "\u2665".encode("utf-8"),
            diamonds: "\u2666".encode("utf-8"),
            spades: "\u2664".encode("utf-8"),
            clubs: "\u2667".encode("utf-8")}

    "#{value} of #{suits[suit]}"
  end


end
