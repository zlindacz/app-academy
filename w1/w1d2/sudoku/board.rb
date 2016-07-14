require_relative 'tile'

class Board
  attr_accessor :grid

  def from_file(filename)
    grid = []
    File.readlines(filename).each do |line|
      grid << line.chomp.chars
    end
    grid
  end

  def initialize(filename)
    @grid = Array.new
    from_file(filename).each do |row|
      @grid << row.map { |tile| Tile.new(tile) }
    end
  end

  def update!(input)
    move, num = input
    y, x = move
    @grid[y.to_i][x.to_i].value = num
  end

  def render
    @grid.each do |row|
      puts row.map { |tile| tile.to_s }.join(" ")
    end
  end

  def solved?
    return false if grid.flatten.any? { |cell| cell.value == '0' }

    # row has 1-9
    return false unless grid.all? {|row| row.drop(0).uniq.length == 9 }

    # column has 1-9
    (0..8).each do |index|
      results = []
      grid.each do |row|
        results << row[index]
      end
      return false unless results.uniq.length == 9
    end

    # mini-squares
    [[0, 1, 2], [3, 4, 5], [6, 7, 8]].each do |col|
      [[0, 1, 2], [3, 4, 5], [6, 7, 8]].each do |row|
        results = []
        col.each do |idxc|
          row.each do |idxr|
            results << @grid[idxr][idxc].value
          end
        end
        return false unless results.uniq.length == 9
      end
    end

    true
  end
end
