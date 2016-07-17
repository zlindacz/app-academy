# Write a recursive method, range, that takes a start and an end and returns an array of all numbers between. If end < start, you can return the empty array.
def range(min, max)

end

# Write both a recursive and iterative version of sum of an array.

def sum_iter(nums)

end

def sum_rec(nums)

end

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

end

def exp2(base, power)

end
#
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibs_iter(n)

end

def fibs_rec(n)

end

# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).
#
# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.
#


def bsearch(nums, target)

end

bsearch([1, 2, 3], 1) # => 0
bsearch([2, 3, 4, 5], 3) # => 1
bsearch([2, 4, 6, 8, 10], 6) # => 2
bsearch([1, 3, 4, 5, 9], 5) # => 3
bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


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

  end

  def dd_inject

  end

  def dd_map

  end

# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

  def merge_sort

  end

  def merge(left, right)

  end

Write a method subsets that will return all subsets of an array.

  def subsets

  end

  subsets([]) # => [[]]
  subsets([1]) # => [[], [1]]
  subsets([1, 2]) # => [[], [1], [2], [1, 2]]
  subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
end
