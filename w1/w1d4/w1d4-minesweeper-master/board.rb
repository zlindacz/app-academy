require 'colorize'
require 'byebug'

require_relative 'tile'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) { Tile.new } }
  end

  def seed_bombs
    bomb_positions.each do |pos|
      self[pos].bomb = true
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def flagged?(pos)
    self[pos].flagged
  end

  def has_bomb?(pos)
    self[pos].bomb
  end

  def revealed?(pos)
    self[pos].revealed
  end

  def set_value!(pos)
    self[pos].set_value!
  end




  def calculate_adjacent_bombs(pos)
    x,y = pos
    adjacent_positions = {:top_left => [x-1, y-1],
                          :top_right => [x-1, y+1],
                          :top => [x-1, y],
                          :right => [x, y+1],
                          :bottom_right => [x+1, y+1],
                          :bottom => [x+1, y],
                          :bottom_left => [x+1, y-1],
                          :left => [x, y-1]}
    counter = 0

    adjacent_positions.values.each do |position|
      next if position.first < 0 || position.last < 0
      counter += 1 if self[position].bomb
    end

    counter
  end









  def explode?
    @grid.any? { |row| row.any? { |tile| tile.bomb && tile.revealed }}
  end

  def win?
    @grid.all? do |row|
      row.all? do |tile|
        (tile.has_bomb? && !tile.revealed) ||
        tile.revealed || tile.flagged
      end
    end
  end


  def to_s
    @grid.each do |row|
      p row.map { |tile| tile.to_s }
    end
  end

  private

  def bomb_positions
    results = []
    while results.size < @grid.length
      pos = []
      2.times { pos << (0...@grid.length).to_a.sample }
      results << pos unless results.include?(pos)
    end
    results
  end
end
