require 'byebug'

class Array
  # def my_each(&prc)
  #   i = 0
  #   while i < length
  #     prc.call(self[i])
  #     i += 1
  #   end
  #   self
  # end

  def my_each(&prc)
    length.times do |i|
      prc.call(self[i])
    end
    self
  end

 # calls my_each twice on the array, printing all the numbers twice.
 return_value = [1, 2, 3].my_each do |num|
   puts num
 end.my_each do |num|
   puts num
 end
 # => 1
 #    2
 #    3
 #    1
 #    2
 #    3

 p return_value  # => [1, 2, 3]

  def my_select(&prc)
    selected = []
    i = 0
    while i < length
      selected << self[i] if prc.call(self[i])
      i += 1
    end
    selected
  end

  def my_select(&prc)
    selected = []
    my_each do |item|
      selected << item if prc.call(item)
    end
    selected
  end

  a = [1, 2, 3]
  # p a.my_select { |num| num > 1 } # => [2, 3]
  p a.my_select { |num| num == 4 } # => []

  def my_reject(&prc)
    results = []
    my_each do |item|
      results << item unless prc.call(item)
    end
    results
  end

  a = [1, 2, 3]
  p a.my_reject { |num| num > 1 } # => [1]
  p a.my_reject { |num| num == 4 } # => [1, 2, 3]

  def my_any?(&prc)
    my_each do |item|
      return true if prc.call(item)
    end
    false
  end

  def my_all?(&prc)
    my_each do |item|
      return false unless prc.call(item)
    end
    true
  end

  a = [1, 2, 3]
  p a.my_any? { |num| num > 1 } # => true
  p a.my_any? { |num| num == 4 } # => false
  p a.my_all? { |num| num > 1 } # => false
  p a.my_all? { |num| num < 4 } # => true

  def my_flatten
    flat = []
    my_each do |item|
      flat += item.is_a?(Array) ? item.my_flatten : [item]
    end
    flat
  end

  def my_flatten
    flat = []
    my_each do |item|
      byebug
      flat << item.is_a?(Array) ? flat.concat(item.my_flatten) : item
    end
    flat
  end

  def my_flatten
    flat = []
    my_each do |item|
      if item.is_a?(Array)
        flat.concat(item.my_flatten)
      else
        flat << item
      end
    end
    flat
  end


  p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

  def my_zip(*arrays)
    zipped = []
    self.size.times do |i|
      subzip = [self[i]]
      arrays.my_each do |arr|
        subzip << arr[i]
      end
      zipped << subzip
    end
    zipped
  end

  a = [ 4, 5, 6 ]
  b = [ 7, 8, 9 ]
  p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

  c = [10, 11, 12]
  d = [13, 14, 15]
  p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

  def my_rotate(positions = 1)
    arr = self.dup
    if positions > 0
      arr.drop(positions%length) + arr.shift(positions%length)
    elsif positions < 0
      arr.pop(positions.abs%length) + arr.take(positions.abs%length)
    else
      self
    end
  end

  def my_rotate(positions = 1)
    split_idx = positions%length

    drop(split_idx) + take(split_idx)
  end

  a = [ "a", "b", "c", "d" ]
  p a.my_rotate         #=> ["b", "c", "d", "a"]
  p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

  def my_join(separator = "")
    sentence = ""

    i = 0
    while i < length
      if i == length - 1
        sentence = sentence + self[i]
      else
        sentence = sentence + self[i] + separator
      end
      i += 1
    end
    sentence
  end

  def my_join(separator = "")
    sentence = ""
    length.times do |i|
      sentence += self[i]
      sentence += separator unless i == length-1
    end
    sentence
  end

  a = [ "a", "b", "c", "d" ]
  p a.my_join         # => "abcd"
  p a.my_join("$")    # => "a$b$c$d"

  def my_reverse
    reversed = []
    (length-1).downto(0).each do |i|
      reversed << self[i]
    end
    reversed
  end

  def my_reverse
    reversed = []
    my_each { |el| reversed.unshift(el) }
    reversed
  end

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  p [ 1 ].my_reverse               #=> [1]

end
