class Board

  def initialize(dimension=4)
    @grid = Array.new(dimension) { Array.new(dimension)}
    @deck = ((0...((dimension**2)/2)).to_a * 2).shuffle
  end

  def populate!
    @grid.each do |row|
      row.map! do |card|
        card = Card.new(@deck.pop)
      end
    end
  end

  def render
    @grid.each do |row|
      puts row.map { |card| card.display }.join(" ")
    end
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false unless card.face_up
      end
    end

    true
  end

  def reveal(pos)
    pos_y, pos_x = pos
    card = @grid[pos_y][pos_x]
    unless card.face_up
      card.face_up = true
      card.face_value
    end
  end

  def [](pos)
    pos_y, pos_x = pos
    @grid[pos_y][pos_x]
  end

end
