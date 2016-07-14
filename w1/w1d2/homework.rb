def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  n + sum_to(n-1)
end

p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num-1) * gamma_fnc(num-1)
end

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040

def powers_sum(n)
  return n if n == 1
  p n
  (n * n) * powers_sum(n - 1)
end


return_val = (temp ** 2) + (arg1 % 6 + 1) / (7 + arg2 + arg1)
