require_relative 'player'
require_relative 'board'
require_relative 'display'

class Chess

  def initialize
    @board = Board.new
    @player = Player.new(@board)
    #@current_player = @player
  end

  def run
    @board.populate!
    until @board.won?
      pos = @player.move
      p "got here"# @board.move(pos)
    end
    puts "Hooray, the board is filled!"
  end

  private

  def notify_players()

  end

  def swap_turn!()

  end
end


if __FILE__ == $PROGRAM_NAME
  Chess.new.run
end
