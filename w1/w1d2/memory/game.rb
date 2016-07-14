require_relative 'board'
require_relative 'card'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :last_revealed, :board

  def initialize(dimension)
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    @board = Board.new(dimension)
    @last_revealed = nil
    @scores = {
      @human.name => 0,
      @computer.name => 0
    }
  end

  def make_guess(move)
    if last_revealed.nil?
      @board.reveal(move)
      @last_revealed = move
    else
      if @board[last_revealed] == @board[move]
        @board.reveal(move)
      else
        @board.reveal(move)
        system("clear")
        @board.render
        sleep(2)
        @board[last_revealed].hide
        @board[move].hide
      end
      @last_revealed = nil
    end
  end

  def play
    moves = 0
    until @board.won?
      system("clear")
      @board.render
      make_guess(@human.prompt_move)
      moves += 1
    end
    system("clear")
    @board.render
    puts "You won in #{moves} moves!"
  end
end


if __FILE__ == $PROGRAM_NAME
  puts "How big do you want the board?"
  dimension = gets.chomp.to_i
  game = Game.new(dimension)
  game.board.populate!
  game.play
end
