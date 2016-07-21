require_relative 'card'

class Deck
  attr_accessor :deck_array
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  FACE_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)


  def initialize
    @deck_array = populate_deck!
  end

  private

  def populate_deck!
    deck_array = []
    FACE_VALUES.each do |value|
      SUITS.each do |suit|
        deck_array << Card.new(value, suit)
      end
    end
    deck_array.shuffle
  end
end

deck1 = Deck.new
deck2 = Deck.new

# p deck1.deck_array.first.face_value == deck2.deck_array.first.face_value
