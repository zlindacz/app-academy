require 'colorize'

class Tile

  attr_accessor :value

  def initialize(value)
    @value = value
    @given = @value.to_i == 0 ? false : true
  end

  def to_s
    @given ? @value.colorize(:green) : @value.colorize(:white)
  end
end
