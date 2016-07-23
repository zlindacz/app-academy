require 'byebug'

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num1, i|
    arr.each_with_index do |num2, j|
      next if i == j
      return true if num1 + num2 == target_sum
    end
  end
  false
end

#Time complexity: O(n^2)

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  sorted.each_with_index do |num, idx|
    arr_copy = sorted.dup
    arr_copy.delete_at(idx)
    target = target_sum - num
    return true unless bsearch(arr_copy, target).nil?
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  half_idx = arr.length/2
  left = arr.take(half_idx)
  right = arr.drop(half_idx+1)

  if target < arr[half_idx]
    bsearch(left, target)
  elsif target > arr[half_idx]
    sub_s = bsearch(right, target)
    sub_s.nil? ? nil : half_idx + sub_s
  else
    half_idx
  end
end

# O(nlogn) because bsearch is O(logn) and we iterate through the array
#in okay_two_sum

def hash_map_two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] += 1
  end
  arr.each do |num|
    target = target_sum - num
    hash[num] -= 1
    return true if hash[target] > 0
    hash[num] += 1
  end
  false
end
arr = [0, 1, 5, 7]
two_sum?(arr, 6) # => should be true
two_sum?(arr, 10) # => should be false

# O(n) because hash map is O(1) and we only need to iterate through array
# once to make the hash map
