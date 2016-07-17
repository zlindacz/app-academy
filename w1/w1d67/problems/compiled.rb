require 'byebug'

class Array

  def my_flatten
    flat = []
    my_each do |item|
      flat += item.is_a?(Array) ? item.my_flatten : [item]
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
    my_each { |el| reversed.unshift(el) }
    reversed
  end

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  p [ 1 ].my_reverse               #=> [1]

end
