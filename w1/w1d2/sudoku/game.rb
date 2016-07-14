require_relative 'board'

class Game
  def initialize(filepath)
    @board = Board.new(filepath)
  end

  def play
    until @board.solved?
      system("clear")
      @board.render
      @board.update!(prompt)
    end
    system("clear")
    @board.render
    puts "You win!"
  end

  def prompt
    puts "Make your move! (x,y)"
    move_input = gets.chomp.split(",")
    puts "What number? (1-9)"
    num_input = gets.chomp
    [move_input, num_input]
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new("./puzzles/puzzle_1.txt").play
end
