require "card"
require "deck"
require "game"
require "hand"
require "player"

describe Card do
  subject(:card) {Card.new("A", :spades)}
  let(:suits) {[:hearts, :diamonds, :spades, :clubs]}
  let(:face_values) { %w(2 3 4 5 6 7 8 9 10 J Q K A) }

  context "value of card" do
    it "returns a value when asked" do
      expect(card.face_value).to_not be_nil
    end

    it "has to have a value that is 2-10, J, Q, K, or A" do
      expect(face_values).to include(card.face_value)
    end

  end

  context "suit of card" do
    it "returns a suit when asked" do
      expect(card.suit).to_not be_nil
    end

    it "has to have a suit that is :hearts, :diamonds, :spades, or :clubs" do
      expect(suits).to include(card.suit)
    end
  end

end

describe Deck do
  subject(:deck) {Deck.new}
  let(:face_values) { %w(2 3 4 5 6 7 8 9 10 J Q K A) }
  it "has 52 cards" do
    expect(deck.deck_array.size).to eq(52)
  end

  it "is shuffled" do
    deck1 = deck
    deck2 = Deck.new
    expect(deck1.deck_array.first.face_value).not_to eq(deck2.deck_array.first.face_value)
  end

  it "has 13 of each suit" do
    expect(deck.deck_array.count { |card| card.suit == :hearts }).to eq(13)
    expect(deck.deck_array.count { |card| card.suit == :diamonds }).to eq(13)
    expect(deck.deck_array.count { |card| card.suit == :spades }).to eq(13)
    expect(deck.deck_array.count { |card| card.suit == :clubs }).to eq(13)
  end

  it "has 4 of each value" do
    four_of_each = face_values.all? do |value|
      deck.deck_array.count { |card| card.face_value == value } == 4
    end
    expect(four_of_each).to be true
  end
end

describe Hand do
  let(:highcard) {Hand.new.cards = [Card.new("2", :spades), Card.new("Q", :hearts), Card.new("3", :diamonds), Card.new("5", :spades), Card.new("J", :clubs)]} ]}
  let(:ace_high) {Hand.new.cards = [Card.new("2", :spades), Card.new("A", :hearts), Card.new("3", :diamonds), Card.new("5", :spades), Card.new("J", :clubs)]} ]}
  let(:one_pair) {Hand.new.cards = [Card.new("2", :spades), Card.new("2", :hearts), Card.new("3", :diamonds), Card.new("5", :spades), Card.new("J", :clubs)]} ]}
  let(:two_pair) {Hand.new.cards = [Card.new("2", :spades), Card.new("Q", :hearts), Card.new("2", :diamonds), Card.new("Q", :spades), Card.new("J", :clubs)]} ]}
  let(:three_of_a_kind) {Hand.new.cards = [Card.new("2", :spades), Card.new("2", :hearts), Card.new("3", :diamonds), Card.new("5", :spades), Card.new("2", :clubs)]} ]}
  let(:ace_low) {Hand.new.cards = [Card.new("2", :spades), Card.new("A", :hearts), Card.new("3", :diamonds), Card.new("5", :spades), Card.new("4", :clubs)]} ]}
  let(:straight) {Hand.new.cards = [Card.new("6", :spades), Card.new("7", :hearts), Card.new("8", :diamonds), Card.new("9", :spades), Card.new("10", :clubs)]} ]}
  let(:flush) {Hand.new.cards = [Card.new("2", :spades), Card.new("Q", :spades), Card.new("3", :spades), Card.new("5", :spades), Card.new("J", :spades)]} ]}
  let(:full_house) {Hand.new.cards = [Card.new("2", :spades), Card.new("Q", :hearts), Card.new("2", :diamonds), Card.new("2", :hearts), Card.new("Q", :clubs)]} ]}
  let(:four_of_a_kind) {Hand.new.cards = [Card.new("2", :spades), Card.new("2", :hearts), Card.new("2", :diamonds), Card.new("2", :clubs), Card.new("J", :clubs)]} ]}
  let(:striaght_flush) {Hand.new.cards = [Card.new("10", :hearts), Card.new("J", :hearts), Card.new("Q", :hearts), Card.new("K", :hearts), Card.new("A", :hearts)]} ]}

  let(:hands) {[:highcard, :ace_high, :one_pair, :two_pair, :three_of_a_kind, :ace_low, :straight, :flush, :full_house, :four_of_a_kind, :striaght_flush]}

  context "recognizes hand values" do
    it "recognizes a highcard"
    it "recognizes ace as high card"
    it "recognizes one pair"
    it "recognizes two pair"
    it "recognizes three-of-a-kind"
    it "recognizes ace as low card"
    it "recognizes a straight"
    it "recognizes a flush"
    it "recognizes a full house"
    it "recognizes four-of-a-kind"
    it "recognizes a striaght flush"
  end

  context "compares hand values" do
    it "knows the hierarchy of different hands" do

      hierarchy_knowledge = hands.each_index do |i|
        j = i + i
        next if i == hands.length
        return false unless Hand.compare(hands[i], hands[j]) == -1
      end
      expect(hierarchy_knowledge).to_not be_false
    end


    it "breaks a tie by high card"
    it "recognizes ties"






  end
end
