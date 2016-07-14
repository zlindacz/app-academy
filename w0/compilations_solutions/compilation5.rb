# ------------------------------------------------------------------------------
# Instructions
# ------------------------------------------------------------------------------
# Make sure everything puts out as 'true' when you run the file.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  Do not reference the exercises.  If you forget a
# particular ruby method, write it yourself.
#
# Do not change the parameters passed into the functions in this file.
#
# Test your code with a few cases in addition to the ones we give
# you.  When we grade you, we use different test cases to make sure your logic
# is sound.
#
# Use the debugger when code doesn't run how you expect.
# ------------------------------------------------------------------------------
#
# Factorial
# ------------------------------------------------------------------------------
# A number factorial is the product of all whole
# numbers between 1 and num multiplied together.
# factorial(4) => 4 * 3 * 2 * 1 => 24
# ------------------------------------------------------------------------------
def factorial(num)
  return 1 if num == 1
  num * factorial(num-1)
end
# ------------------------------------------------------------------------------
puts "-------Factorial-------"
puts factorial(1) == 1
puts factorial(4) == 24
puts factorial(5) == 120
puts factorial(10) == 3628800
# ------------------------------------------------------------------------------

# Long Word Count
# ------------------------------------------------------------------------------
# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2
# ------------------------------------------------------------------------------
def long_word_count(text)
  text.split.select { |word| word.length > 7 }.count
end
# ------------------------------------------------------------------------------
puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2
puts long_word_count("seventy schfifty five") == 1
# ------------------------------------------------------------------------------

# Least Common Multiple
# ------------------------------------------------------------------------------
# Return the lowest number which is a multiple of both inputs.
#
# Example of a multiple: 12 is a multiple of 4 because 12 is evenly
# divisible by 4.
#
# the least common multiple of 2 and 3 is 6
# the least common multiple of 6 and 10 is 30
# it is NOT ALWAYS the product of the inputs
# lcm(6, 10) => 30
#
# the lcm for equal numbers is that number
# lcm(50, 50) => 50
# ------------------------------------------------------------------------------
def lcm(a, b)
  i = 1
  while true
    return i if i % a == 0 && i % b == 0
    i += 1
  end
end

# ------------------------------------------------------------------------------
puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(24, 26) == 312
puts lcm(50, 50) == 50
# ------------------------------------------------------------------------------

# Largest Odd Factors
# ------------------------------------------------------------------------------
# Return an array of the largest odd factors NOT including the number itsself
# The factors of 20 are 1, 2, 5, and 10
# The largest odd factor of 20 is 5 because 10 is even
# largest_odd_factors([10, 20, 30]) => [5, 5, 15]
# ------------------------------------------------------------------------------
def largest_odd_factors(nums)
  nums.map { |num| odd_factors(num).max }
end

def odd_factors(num)
  (1...num).select { |i| num % i == 0 && i % 2 == 1 }
end

# ------------------------------------------------------------------------------
puts "-------Largest Odd Factor-------"
puts largest_odd_factors([]) == []
puts largest_odd_factors([5]) == [1]
puts largest_odd_factors([8]) == [1]
puts largest_odd_factors([26, 27, 28, 29]) == [13, 9, 7, 1]
puts largest_odd_factors([10, 20, 30]) == [5, 5, 15]
# ------------------------------------------------------------------------------

# Fibonacci Sequence
# ------------------------------------------------------------------------------
# The Fibonacci sequence is defined as fib(n) = fib(n - 1) + fib(n - 2).
# The sequence starts with 0 and 1 as the first two Fibonacci numbers
# and builds up from there, each subsequent Fibonacci being the sum of
# the previous two.
#
# Return the first n many Fibonacci numbers, starting with 0.
# fibs(5) => [0, 1, 1, 2, 3]
# ------------------------------------------------------------------------------
def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  base = [0, 1]
  (n-2).times do |i|
    base << (base[-1]+base[-2])
  end
  base
end

# ------------------------------------------------------------------------------
puts "-------Fibonacci-------"
puts fibs(0) == []
puts fibs(1) == [0]
puts fibs(2) == [0, 1]
puts fibs(3) == [0, 1, 1]
puts fibs(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# ------------------------------------------------------------------------------

# # Hipsterfy
# # ------------------------------------------------------------------------------
# # Input is a string containing several words.
# # Return a string with the last vowel removed from each word. 'y' is not a vowel.
# # If a word has no vowels, don't change it.
# #
# # hipsterfy("towel flicker banana") => "towl flickr banan"
# # ------------------------------------------------------------------------------

def hipsterfy(str)
  str.split.map { |word| hips(word) }.join(' ')
end

def hips(word)
  index = /[aeiou]/ =~ word.reverse
  if index
    arr = word.reverse.chars
    arr.delete_at(index)
    arr.reverse.join
  else
    word
  end
end

# ------------------------------------------------------------------------------
puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("squeaker") == "squeakr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("proper tonic panther") == "propr tonc panthr"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("runner anaconda") == "runnr anacond"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"

# ------------------------------------------------------------------------------
# Pair Product
# ------------------------------------------------------------------------------
# Given an array of numbers and a target product, return whether any pair of
# elements in the array multiplied together equals that product.
#
# You cannot multiply an element by itself.  An element on its own is not
# a product.
#
# pair_product?([3, 1, 5], 15) => true
# ------------------------------------------------------------------------------
def pair_product?(arr, target_product)
  arr.combination(2).any? { |pair| pair.inject(:*) == target_product }
end
# ------------------------------------------------------------------------------
puts "-------Pair Product-------"
puts pair_product?([5, 10, 15, 20, 25, 30], 75) == true
puts pair_product?([2, 4, 8, 16], 128) == true
puts pair_product?([10, 20], 10) == false
puts pair_product?([1, 2], 4) == false
puts pair_product?([], 1) == false

# ------------------------------------------------------------------------------

# # # Repeated Chars
# # # ------------------------------------------------------------------------------
# # # Input is a word.
# # # Return an array of all the characters that appear multiple times consecutively.
# # # repeated_chars("mississippi") => ["s, s, p"]
# # # ------------------------------------------------------------------------------


def repeated_chars(word)
  repeated = word.chars.chunk_while { |i, j| i == j }.to_a
  repeated.delete_if { |arr| arr.count == 1 }
  repeated.map { |arr| arr[0] }
end

# ------------------------------------------------------------------------------
puts "-------Repeated Chars-------"
puts repeated_chars("cat") == []
puts repeated_chars("caat") == ['a']
puts repeated_chars("applle") == ['p', 'l']
puts repeated_chars("mississippi") == ['s', 's', 'p']
puts repeated_chars("caataapulllllt") == ['a', 'a', 'l']


# # # ------------------------------------------------------------------------------
# # # Finished?
# # # ------------------------------------------------------------------------------
# # # Make sure everything puts out as 'true' when you run the file.
# # # Make sure you don't have any unexpected `end`s or infinite loops
# # # that would keep your code from running.
# # #
# # # Rename the file to be your firstname and lastname.
# # # ------------------------------------------------------------------------------
