# Write a recursive method, range, that takes a start and an end and returns an array of all numbers between. If end < start, you can return the empty array.
def range(min, max)
  return [] if min > max
  return [min] if max == min
  [min] + range(min+1, max)
end

# p range(5, 10) # [5, 6, 7, 8, 9, 10]
# p range(5, -2) # []
# p range(5, 5) # [5]

# Write both a recursive and iterative version of sum of an array.

def sum_iter(nums)
  sum = 0
  nums.each do |num|
    sum += num
  end
  sum
end

# p sum_iter([1, 2, 3])

def sum_rec(nums)
  return nums.first if nums.size <= 1
  nums.first + sum_rec(nums.drop(1))
end

# p sum_rec([1, 2, 3])

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
#
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp1(base, power)
  return 1 if power == 0
  base * exp1(base, (power-1))
end

# p exp1(30,0) # 1
# p exp1(2,3) # 8
# p exp1(10,2) # 100

def exp2(base, power)
  return 1 if power == 0
  if power.even?
    half_power = exp2(base, power/2)
    half_power * half_power
  else
    less_than_half_power = exp2(base, (power-1)/2)
    base * less_than_half_power * less_than_half_power
  end
end

# p exp1(30,0) # 1
# p exp1(2,3) # 8
# p exp1(10,2) # 100


# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibs_iter(n)
  return nil if n == 0
  return 1 if n == 1
  fibs = [1,1]
  until fibs.size == n
    fibs << (fibs[-1] + fibs[-2])
  end
  fibs
end

# p fibs_iter(0)
# p fibs_iter(3)
# p fibs_iter(5)
# p fibs_iter(6)


def fibs_rec(n)
  return [] if n <= 0
  return [1] if n == 1
  return [1,1] if n == 2
  prev_fib = fibs_rec(n-1)
  next_fib = prev_fib[-1] + prev_fib[-2]

  prev_fib << next_fib
end

# p fibs_rec(0)
# p fibs_rec(3)
# p fibs_rec(5)
# p fibs_rec(6)

# return the nth Fibonacci numbers

def fibs(n)
  return nil if n <= 0
  return 1 if n == 1
  return 1 if n == 2
  fibs(n-1) + fibs(n-2)
end

# p fibs(0) #[]
# p fibs(2) # 1
# p fibs(5) # 5
# p fibs(6) # 8


# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).
#
# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.
#


# def bsearch(nums, target)
#
#   return nil if nums.empty?
#   half_idx = nums.length/2
#   left_half = nums.take(half_idx)
#   right_half = nums.drop(half_idx+1)
#
#   if target < nums[half_idx]
#     bsearch(left_half, target)
#   elsif target > nums[half_idx]
#     sub_answer = bsearch(right_half, target)
#     sub_answer.nil? ? nil : (half_idx+1) + sub_answer
#   else
#     half_idx
#   end
# end

def bsearch(arr, target)
  if arr.length == 1
    arr[0] == target ? 0 : "Not found!"
  elsif target >= arr[arr.length/2]
    value = bsearch(arr[arr.length/2..-1], target)
    if value == "Not found!"
      return value
    else
      arr[0...(arr.length/2)].size + value
    end
  else
    bsearch(arr[0...arr.length/2], target)
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([2,5,60,89,102,30,1000], 60)


 # For example, if we need to give 39 cents change in the United States (where there are 25, 10, 5, and 1 cent pieces), we can give:

# First, write a 'greedy' version called greedy_make_change:
#
# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
#
# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).
#
# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.
#
# Discuss the following game plan and then work together to implement your new method:
#
# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using all of the same coins.
# Add the change for the remainder to the single coin you originally grabbed to obtain a possible solution.
# Keep track of the best solution and return it at the end.

def make_change(target, coins = [25, 10, 5, 1])

end

class Array
  # Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.
  def deep_dup
    dup = []
    each do |el|
      dup << (el.is_a?(Array) ? el.deep_dup : el)
    end
  end
  a = [1, 2, [3, [4, 5]]]
  # p a.deep_dup
  # p a

  def dd_inject
    inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.dd_inject : el) }
  end
  b = [1, 2, [3, [4, 5]]]
  # p b.dd_inject
  # p b

  def dd_map
    map { |el| el.is_a?(Array) ? el.dd_map : el }
  end

  c = [1, 2, [3, [4, 5]]]
  # p c.dd_map
  # p c

# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

  def merge_sort
    return self if size <= 1

    split_idx = self.length/2
    left = self.take(split_idx)
    right = self.drop(split_idx)

    merge(left.merge_sort, right.merge_sort)
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      if left.first > right.first
        sorted << right.shift
      else
        sorted << left.shift
      end
    end
    sorted + left + right
  end

  a = [3, 2, 5, 4, 7, 1, 6, 8]
  # p a.merge_sort


# Write a method subsets that will return all subsets of an array.

  def subsets
    return [[]] if empty?
    subs = self[0...-1].subsets
    subs.concat( subs.map {|sub| sub + [last] })
  end

  # p [].subsets # => [[]]
  # p [1].subsets # => [[], [1]]
  # p [1, 2].subsets # => [[], [1], [2], [1, 2]]
  # p [1, 2, 3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
end

def pascals(row)
  return [] if row < 0
  return [1] if row == 0
  new_row = [1]
  prev_row = pascals(row-1)
  prev_row.each_with_index do |el, idx|
    next if idx == prev_row.length-1
    new_row << el + prev_row[idx+1]
  end
  new_row << 1
end

p pascals(-2) # []
p pascals(1) # [1]
p pascals(2) # [1,1]
p pascals(3) # [1, 2, 1]
p pascals(5) # [1, 4, 6, 4, 1]

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
 # integer. If it is greater than 10, sum the digits of the resulting number.
 # Keep repeating until there is only one digit in the result, called the
 # "digital root". **Do not use string conversion within your method.**
 #
 # You may wish to use a helper function, `digital_root_step(num)` which performs
 # one step of the process.

 def digital_root(num)
   digits = []
   while num > 0
     digits << num % 10
     num /= 10
   end
   digit_sum = digits.inject(:+)
   digit_sum > 10 ? digital_root(digit_sum) : digit_sum

 end

 # Write a recursive method that takes in a base 10 number n and
 # converts it to a base b number. Return the new number as a string
 #
 # E.g. base_converter(5, 2) == "101"
 # base_converter(31, 16) == "1f"

 def base_converter(num, b)
   return "" if num == 0
   digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
   base_converter(num/b, b) + digits[num%b]
 end

 # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)

  end
  # Write a recursive function that returns the prime factorization of
   # a given number. Assume num > 1
   #
   # prime_factorization(12) => [2,2,3]
   def prime_factorization(num)

   end

   ​
# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).
​
# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
​
def jumble_sort(str, alphabet = nil)
​
end
​
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
