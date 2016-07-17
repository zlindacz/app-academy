require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
  attr_accessor :visited_positions
  MOVES = [[-2, -1], [-2, 1], [2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

  def self.valid_moves(position)
    new_pos = []
    MOVES.each do |move|
      new_pos << position.map.with_index {|coord, idx| coord + move[idx]}
    end
    new_pos.select {|pos| pos.each {|el| el.between?(0, 7)}}.uniq
  end

  def initialize(starting_pos = [0,0])
    @start = PolyTreeNode.new(starting_pos)
    @visited_positions = [starting_pos]
  end

  def find_path

  end

  def build_move_tree

  end

  def new_move_positions(position)
    # debugger
    @visited_positions << KnightPathFinder.valid_moves(position) - @visited_positions
  end
end


game = KnightPathFinder.new([3, 3])
# p KnightPathFinder.valid_moves(positions)
# p KnightPathFinder::valid_moves([3,3])
game.visited_positions = [[5,2]]
game.new_move_positions([3,3])
game.new_move_positions([1,2])
game.new_move_positions([5,4])

p game.visited_positions
