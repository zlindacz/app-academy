require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @board.seed_bombs
  end

  def over?
    @board.explode? || @board.win?
  end

  private


end
