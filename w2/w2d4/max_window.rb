require 'byebug'

def naive_max_window(array, window_size)
  windows = []
  array.each_with_index do |num, idx|
    windows << array.slice(idx, window_size)
  end
  windows.max_by { |a| a.last - a.first }
end

# O(n) time complexity

p naive_max_window([1, 0, 2, 5, 4, 8], 3)
