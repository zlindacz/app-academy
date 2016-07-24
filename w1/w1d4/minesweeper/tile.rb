class Tile
  attr_accessor :revealed, :bomb, :flagged, :number_of_adjacent_bombs

  def initialize
    @revealed = false
    @flagged = false
    @bomb = false
    @value = 0
  end

  def reveal!
    @revealed = true unless @flagged
  end

  def toggle_flag
    flagged ? @flagged = false : @flagged = true
  end

  def set_value!(number_of_adjacent_bombs)
    value = number_of_adjacent_bombs
  end

  private


end
