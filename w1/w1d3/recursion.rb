# MAX_STACK_SIZE = 200
# tracer = proc do |event|
#   if event == 'call' && caller_locations.length > MAX_STACK_SIZE
#     fail "Probable Stack Overflow"
#   end
# end
# set_trace_func(tracer)

require 'byebug'
def range_recursive(start, finish)
  return [] if finish < start
  return [finish] if finish == start
  result = [start]
  result += range_recursive(start+1, finish)
  result
end

def range_iterative(start, finish)
  result = []
  i = 0
  until (start + i) > finish
    result << start + i
    i += 1
  end
  result
end

def exp_1(base, exponent)
  return 1 if exponent == 0
  base * exp_1(base, exponent-1)
end


def exp_2(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1
  if exponent.even?
    result = exp_2(base, exponent/2)
    result * result
  else
    base * exp_2(exp_2(base, ((exponent-1)/2)), 2)
  end
end

def timing
  a = Time.now
  exp_1(20, 400)
  b = Time.now
  puts b-a

  c = Time.now
  exp_2(20, 400)
  d = Time.now
  puts d-c
end

class Array
  def deep_dup
    results = []
    each do |element|
      if element.is_a? Array
        results += (Array.new << element.deep_dup)
      else
        results << element
      end
    end
    results
  end

  # def deep_dup
  #   return nil if empty?
  #   return self if length == 1
  #   results = []
  #   results += (Array.new << self[1..-1].deep_dup)
  #   results
  # end

  # def deep_dup
  #   results = []
  #   each do |element|
  #     return nil if empty?
  #     return [element] if length == 1
  #
  #     results += (Array.new << element.deep_dup)
  #   end
  #   results
  # end
end


def fibonacci(n)
  return [1] if n == 1
  return [1, 1] if n == 2

  previous = fibonacci(n-1)
  result = []
  result += previous
  result << (previous[-1] + previous[-2])
end

def fibonacci_number(n)
  return 1 if n == 1 || n == 2
  fibonacci_number(n-1) + fibonacci_number(n-2)
end

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

def merge_sort(arr)
  if arr.length == 0 || arr.length == 1
    return arr
  else
    left_side = arr[0...(arr.length/2)]
    right_side = arr[(arr.length/2)..-1]

    merge_helper([merge_sort(left_side), merge_sort(right_side)])
  end
end

def merge_helper(arr)
  arr_1, arr_2 = arr
  if arr_1.empty?
    return arr_2
  elsif arr_2.empty?
    return arr_1
  end
  if arr_1.first < arr_2.first
    [arr_1.shift] + (merge_helper(arr))
  else
    [arr_2.shift] + (merge_helper(arr))
  end
end

def subsets(arr)
  return [arr] if arr.empty?
  return [[], arr] if arr.size == 1
  values = subsets(arr[0..-2])
  values = values + values.map { |el| el + [arr.last] }
end

def greedy_make_change(num, denom=[10, 7, 1])
  return [] if num == 0
  denom.each do |amount|
    if num / amount == 0
      denom = denom[1..-1]
      next
    else
      return [amount] + greedy_make_change((num-amount), denom)
    end
  end
end

def make_better_change(num, denom=[10, 7, 1])
  return [] if num == 0
  hash = {}
  denom.each do |amount|
    hash[amount] = [(num/amount), (num%amount), (num/amount + num%amount)]
  end
  min = hash.min_by { |key, value| value[2] }
  [min.first] + make_better_change(num-min.first)
end
