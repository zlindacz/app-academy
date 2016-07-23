require 'byebug'

def my_min_slow(arr)
  arr.each_index do |i|
    smallest = true
    arr.each_index do |j|
      next if i == j
      if arr[j] <= arr[i]
        smallest = false
        break
      end
    end
    return arr[i] if smallest
  end
end

# Time complexity: O(n^2)

def my_min_fast(arr)
  current_min = arr.first
  (arr[1]...arr.length).each do |i|
    if arr[i] < current_min
      current_min = arr[i]
    end
  end
  current_min
end

# Time complexity: O(n)

def sub_sum_slow(arr)
  combinations = []
  arr.each_index do |i|
    (i+1...arr.length).each do |j|
      combinations << arr[i..j].inject(:+)
    end
  end
  combinations.max
end

# Time complexity: O(n^2)

def sub_sum_fast(arr)
  biggest_sum = arr.first
  current_sum = arr.first
  arr[1..-1].each do |el|
    current_sum += el
    if el > current_sum
      biggest_sum = el
      current_sum = el
    else
      biggest_sum = current_sum
    end
  end
  biggest_sum
end
 # O(n) and O(1)

def largest_contiguous_subsum2(array)
  largest = array.first
  current = 0

  array.each do |el|
    current += el
    largest = current if current > largest
    current = 0 if current < 0
  end

  largest
end

# O(n) and O(1)
