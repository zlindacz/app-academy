class ComputerPlayer
  attr_reader :name

  def initialize
    @name = "Computer"
    @known_cards = {}
    @matched_cards = []
  end

  def prompt_move

    # if @known_cards.keys.any? { |k| k.length == 2 }
  end

  def receive_match()
  end

  def receive_revealed_card()
  end
end
