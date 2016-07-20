require_relative 'piece'
require_relative 'errors'
require 'byebug'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def [](row, col)
    grid[row][col]
  end

  def []=(row, col, piece)
    grid[row][col] = piece
  end

  def populate!
    grid.each_with_index do |row, i|
      if i == 0
        row.each_with_index do |col, j|
          case j
            when 0
              self[*[i, j]] = Rook.new([i, j], :black)
            when 1
              self[*[i, j]] = Knight.new([i, j], :black)
            when 2
              self[*[i, j]] = Bishop.new([i, j], :black)
            when 3
              self[*[i, j]] = Queen.new([i, j], :black)
            when 4
              self[*[i, j]] = King.new([i, j], :black)
            when 5
              self[*[i, j]] = Bishop.new([i, j], :black)
            when 6
              self[*[i, j]] = Knight.new([i, j], :black)
            when 7
              self[*[i, j]] = Rook.new([i, j], :black)
          end
        end
      elsif i == 7
        row.each_with_index do |col, j|
          case j
            when 0
              self[*[i, j]] = Rook.new([i, j], :white)
            when 1
              self[*[i, j]] = Knight.new([i, j], :white)
            when 2
              self[*[i, j]] = Bishop.new([i, j], :white)
            when 3
              self[*[i, j]] = Queen.new([i, j], :white)
            when 4
              self[*[i, j]] = King.new([i, j], :white)
            when 5
              self[*[i, j]] = Bishop.new([i, j], :white)
            when 6
              self[*[i, j]] = Knight.new([i, j], :white)
            when 7
              self[*[i, j]] = Rook.new([i, j], :white)
          end
        end
      elsif i == 1
        row.map!.with_index {|space, j| self[*[i, j]] = Pawn.new([i, j], :black)}
      elsif i == 6
        row.map!.with_index {|space, j| self[*[i, j]] = Pawn.new([i, j], :white)}
      else
        row.map!.with_index {|space, j| self[*[i, j]] = NullPiece.instance}
      end
    end
  end

  def move(start_pos, end_pos, color)
    if self[*start_pos].class == NullPiece
      raise PieceError.new("Nothing at this position.")
    elsif !self[*start_pos].valid_move?(start_pos, end_pos)
      raise PieceError.new("Cannot complete move.")
    end
    # logic for making the move if positions check out
  end


  def won?
    false
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  protected

  def find_king(color)

  end

end

b = Board.new
b.populate!
b.display
