#!/usr/bin/env ruby
require 'io/console'
require 'benchmark'

class SortingDemo
  # Bubble Sort: O(n^2)
  def self.bubble_sort!(array)
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array
  end

  def self.bubble_sort(array)
    bubble_sort!(array.dup)
  end

  # Merge Sort: O(n*lg(n))
  def self.merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def self.performance_test(size, count)
    arrays_to_test = Array.new(count) { random_arr(size) }

    Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                        "Avg. Merge:  ", "Avg. Bubble: ") do |b|
      merge = b.report("Tot. Merge:  ") { run_merge_sort(arrays_to_test) }
      bubble = b.report("Tot. Bubble: ") { run_bubble_sort(arrays_to_test) }
      [merge/count, bubble/count]
    end
  end

  def self.random_arr(n)
    Array.new(n) { rand(n) }
  end

  def self.run_bubble_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      bubble_sort(array_to_test)
    end
  end

  def self.run_merge_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      merge_sort(array_to_test)
    end
  end

  def self.run_performance_tests(multiplier = 5, rounds = 3)
    [1, 10, 100, 1000, 10000].each do |size|
      size *= multiplier
      wait_for_keypress(
        "Press any key to benchmark sorts for #{size} elements"
      )
      performance_test(size, rounds)
    end
  end

  def self.wait_for_keypress(prompt)
    puts prompt
    STDIN.getch
  end
end

SortingDemo.run_performance_tests()
# Press any key to benchmark sorts for 5 elements
#                 user     system      total        real
# Tot. Merge:    0.000000   0.000000   0.000000 (  0.000069)
# Tot. Bubble:   0.000000   0.000000   0.000000 (  0.000031)
# Avg. Merge:    0.000000   0.000000   0.000000 (  0.000023)
# Avg. Bubble:   0.000000   0.000000   0.000000 (  0.000010)
# Press any key to benchmark sorts for 50 elements
#                 user     system      total        real
# Tot. Merge:    0.010000   0.000000   0.010000 (  0.001185)
# Tot. Bubble:   0.000000   0.000000   0.000000 (  0.001902)
# Avg. Merge:    0.003333   0.000000   0.003333 (  0.000395)
# Avg. Bubble:   0.000000   0.000000   0.000000 (  0.000634)
# Press any key to benchmark sorts for 500 elements
#                 user     system      total        real
# Tot. Merge:    0.010000   0.000000   0.010000 (  0.007839)
# Tot. Bubble:   0.060000   0.000000   0.060000 (  0.061606)
# Avg. Merge:    0.003333   0.000000   0.003333 (  0.002613)
# Avg. Bubble:   0.020000   0.000000   0.020000 (  0.020535)
# Press any key to benchmark sorts for 5000 elements
#                 user     system      total        real
# Tot. Merge:    0.110000   0.000000   0.110000 (  0.106904)
# Tot. Bubble:   5.400000   0.000000   5.400000 (  5.394619)
# Avg. Merge:    0.036667   0.000000   0.036667 (  0.035635)
# Avg. Bubble:   1.800000   0.000000   1.800000 (  1.798206)
# Press any key to benchmark sorts for 50000 elements
#                 user     system      total        real
# Tot. Merge:    0.510000   0.000000   0.510000 (  0.513012)
# Tot. Bubble: 547.500000   0.000000 547.500000 (546.893670)
# Avg. Merge:    0.170000   0.000000   0.170000 (  0.171004)
# Avg. Bubble: 182.500000   0.000000 182.500000 (182.297890)
