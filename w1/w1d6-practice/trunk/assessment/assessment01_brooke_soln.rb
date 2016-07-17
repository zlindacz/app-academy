require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    start_idx = accumulator.nil? ? 1 : 0
    accumulator ||= self.first

    (start_idx...self.length).each do |idx|
      accumulator = yield(accumulator, self[idx])
    end

    accumulator
  end

  def my_inject(accumulator = nil, &prc)
    start_idx = accumulator.nil? ? 1 : 0
    accumulator ||= self.first

    (start_idx...self.length).each do |idx|
      accumulator = prc.call(accumulator, self[idx])
    end

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? { |i| num % i == 0 }
end

def primes(num)
  results = []
  i = 2
  until results.size == num
    results << i if is_prime?(i)
    i += 1
  end
  results
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num) # 2
  return [] if num == 0
  return [1] if num == 1

  prev_factorials = factorials_rec(num - 1) # [1]
  next_factorial = prev_factorials.last * (num - 1)

  prev_factorials << next_factorial #[1, 1]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups_hash = Hash.new { |h, k| h[k] = [] }

    self.each_with_index do |el, idx|
      if self.count(el) > 1
        dups_hash[el] << idx
      end
    end

    dups_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if length <= 1

    prc ||= Proc.new { |a, b| a <=> b }

    half_idx = self.length / 2
    left = self.take(half_idx)
    right = self.drop(half_idx)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted_arr = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        sorted_arr << left.shift
      else
        sorted_arr << right.shift
      end
    end

    sorted_arr.concat(left).concat(right)
  end
end
