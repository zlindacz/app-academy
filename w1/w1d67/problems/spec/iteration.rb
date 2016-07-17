require 'byebug'

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  results = []
  (1..num).each { |i| results << i if num % i == 0 }
  results
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  substr = []
  (0...string.length).each do |start|
    (1...string.length).each do |length|
      segment = string[start, length]
      substr << segment unless substr.include?(segment)
    end
  end
  substr
end

def subwords(word, dictionary)
  substrings(word).select { |substr| dictionary.include?(substr) }
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.map { |el| el*2 }
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"

def concatenate(strings)
  strings.inject { |sentence, str| sentence += str }
end

class Array
  # After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.

  def bubble_sort!
    sorted = false
    until sorted
      sorted = true
      each_with_index do |num, idx|
        break if idx == length-1
        if num > self[idx]
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sorted = false
        end
      end
    end
    self
  end


  def bubble_sort
    copy = self.dup
    copy.bubble_sort!
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |a,b| a <=> b }
    sorted = false
    until sorted
      sorted = true
      each_with_index do |num, idx|
        break if idx == length-1
        if prc.call(num, self[idx+1]) == 1
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sorted = false
        end
      end
    end
    self
  end

  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_map(&prc)
    results = []
    my_each { |item| results << prc.call(item) }
    results
  end

  def my_select(&prc)
    selected = []
    my_each { |item| selected << item if prc.call(item) }
    selected
  end

  # * Implement a `my_inject` method. Your version shouldn't take an
  #   optional starting argument; just use the first element. Ruby's
  #   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
  #   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
  #   (and not the symbol) version. Again, use your `my_each` to define
  #   `my_inject`. Again, do not modify the original array.

  def my_inject(&blk)
    start = self.first
    self[1...length].my_each { |item| start = blk.call(start, item) }
    start
  end
end
