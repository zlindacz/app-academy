class Piece
  attr_reader :color

  def initialize(pos, color)
    @pos = pos
    @color = color
  end

  def valid_move?(start_pos, end_pos)
    # raise error or rescue(?) if another of one's piece at the location
    # checks if the end pos is included in list of valid moves
  end


end

class SlidingPiece < Piece
  def possible_moves(moves_const)
    possible = []

    cur_x, cur_y = pos
    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        possible << new_pos
      end
    end
    possible
  end


end
class SteppingPiece < Piece
  def possible_moves(moves_const)
    valid_moves = []

    cur_x, cur_y = pos
    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end
    valid_moves
  end
end

require 'singleton'
class NullPiece
  include Singleton
  def color
  end

  def to_s
    "   "
  end

end


class Bishop < SlidingPiece
  def initialize(pos, color)
    super(pos, color)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " B "
  end
end

class Queen < SlidingPiece
  MOVES = []
  def initialize(pos, color)
    super(pos, color)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " \u265b "
    # " Q  "
  end
end

class Rook < SlidingPiece
  MOVES = []
  def initialize(pos, color)
    super(pos, color)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " R "
  end
end

class King < SteppingPiece
  MOVES = [[-1, 0], [-1, 1], [0, 1], [1, -1], [1, 1], [-1, -1], [-1, 0], [0, -1]]

  def initialize(pos, color)
    super(pos, color)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " K "
  end
end

class Knight < SteppingPiece

  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
  def initialize(pos, color)
    super(pos, color)
  end

  def valid_move?(start_pos, end_pos)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " N "
  end
end

class Pawn < Piece
  def initialize(pos, color)
    super(pos, color)
  end

  def possible_moves(moves)
    super(MOVES)
  end

  def to_s
    " P "
  end
end
