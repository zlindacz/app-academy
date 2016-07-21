def remove_dups(arr)
  arr.uniq
end
#
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:
#[1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

class Array
  def two_sum
    results = []
    length.times do |i|
      (i+1...length).each do |j|
        results << [i , j] if self[i] + self[j] == 0
      end
    end
    results.sort
  end
end

#
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.
#
# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":
#
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)



# My Transpose

def my_transpose(matrix)
  transposed = []
  matrix.first.length.times do |idx|
    new_row = []
    matrix.each do |row|
      new_row << row[idx]
    end
    transposed << new_row
  end
  transposed
end
#
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:
#
rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

  # p my_transpose(rows)

#

# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:
#
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:
#
# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# Stock Picker
# [8,4,5,3,2,9,1]

require 'byebug'
def stock_picker(arr)
  combinations = (0...arr.length).to_a.combination(2)
  combinations.to_a.max_by do |buy,sell|
    arr[sell]-arr[buy]
  end
end

  # p stock_picker([8,4,5,3,2,9,1])


# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!




# Towers of Hanoi
#
# Write a Towers of Hanoi game.
#
# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!
#
# Note: don't worry about testing the UI. Testing console I/O is tricky (don't bother checking gets or puts). Focus on:
#
# #move
# #won?
class MoveError < StandardError
  "bad move"
end


class TowersOfHanoi
  attr_reader :towers
  def initialize
    @towers = [[], [3,2,1], []]
  end

  def move(start, finish)
    end_tower = @towers[finish]
    start_tower = @towers[start]
    # byebug
    if end_tower.last && start_tower.last &&
      (end_tower.last < start_tower.last)
      raise MoveError
    else
      end_tower.push(start_tower.pop)
    end
  end

  def won?
    @towers.include?([3,2,1]) && @towers[1].empty?
  end
end
