require 'byebug'

class Array

  def my_flatten

  end

  p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
  def my_zip(*arrays)

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

  end

  a = [ "a", "b", "c", "d" ]
  p a.my_rotate         #=> ["b", "c", "d", "a"]
  p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

  def my_join(separator = "")

  end

  a = [ "a", "b", "c", "d" ]
  p a.my_join         # => "abcd"
  p a.my_join("$")    # => "a$b$c$d"

  def my_reverse

  end

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  p [ 1 ].my_reverse               #=> [1]

  def my_inject(&blk)

  end

  p [1, 2, 3].my_inject { |product, i| product * i } # 6
  p ['1', '2', '3'].my_inject { |str, el| str += el } # "123"

  def bubble_sort!

  end

  a = [4, 2, 5, 1, 3]
  p a.bubble_sort!
  p a

  def bubble_sort!(&prc)

  end

  b = [3, 2, 5, 1, 4]
  p b.bubble_sort! { |a,b| b > a }
  p b

end


# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)

end

# Test Cases:
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


# EXERCISE 2

# Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.

def add_numbers(arr)

end

# Test Cases:
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil


# EXERCISE 3

# Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(num)

end

# Test Cases:
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
