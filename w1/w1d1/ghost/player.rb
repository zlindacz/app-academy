class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess
    puts "Guess a letter."
    letter = gets.chomp
  end

  def alert_invalid_guess(letter)

  end
end
