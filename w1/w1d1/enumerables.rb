require 'byebug'
class Array
  def my_each(&block)
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
  self
  end

  def my_select(&block)
    results = []
    self.my_each do |el|
      results << el if (yield el)
    end
    results
  end

  def my_reject(&block)
    results = []
    self.my_each do |el|
      results << el if !(yield el)
    end
    results
  end

  def my_any(&block)
    self.my_each do |el|
      return true if (yield el)
    end
    false
  end

  def my_all(&block)
    self.my_each do |el|
      return false unless (yield el)
    end
  end

  # def my_all(&block)
  #   results = []
  #   self.my_each do |el|
  #     results << el if (yield el)
  #   end
  #   results == self
  # end

  # def my_flatten
  #   results = []
  #   self.my_each do |el|
  #     if el.is_a? Array
  #       el.my_each { |el| results << el }
  #     else
  #       results << el
  #     end
  #   end
  #   if results.my_any {|el| el.is_a? Array }
  #     results.my_flatten
  #   else
  #     results
  #   end
  # end

  def my_flatten
    results = []
    self.my_each do |el|
      if el.is_a? Array
        results += el.my_flatten
      else
        results << el
      end
    end
    results
  end

  def my_zip(*arrays)
    results = []
    new_element = []
    (0...self.length).each do |index1|
      new_element << self[index1]
      (0...arrays.length).each do |index2|
        new_element << arrays[index2][index1]
      end
      results << new_element
      new_element = []
    end
    results
  end

  def my_rotate(direction = 1)  # can refactor later
    results = self.dup
    if direction > 0
      results.push(results.shift(direction % self.length))
    elsif direction < 0
      results.unshift(results.pop(direction.abs % self.length))
    end
  results.my_flatten
  end

  def my_join(separator="")
    results = ""
    (0...self.length-1).each do |index|
      results += "#{self[index]}#{separator}"
    end
    results += self[-1]
  end

  def my_reverse
    results = []
    (length-1).downto(0).each do |index|
      results << self[index]
    end
    results
  end

end


if __FILE__ == $PROGRAM_NAME
 #  return_value = [1, 2, 3].each do |num|
 #    puts num * 2
 #  end.each do |num|
 #   puts num
 # end
 p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
end
