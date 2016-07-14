class HumanPlayer
  attr_reader :name

  def initialize
    puts "What's your name?"
    @name = gets.chomp
  end

  def prompt_move
    puts "Flip a card! (x,y)"
    input = gets.chomp.chars
    move = [input.first.to_i, input.last.to_i]
  end
end
