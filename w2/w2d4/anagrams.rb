def first_anagram?(str1, str2)
  anagrams_1 = str1.chars.permutation(str1.length)
  anagrams_1.map(&:join).any? { |anagram| anagram == str2 }
end

# times complexity: O(n!). Increasing one letter would increase the number
# of combinations by a factor if the total number of letters in string

def second_anagram?(str1, str2)
  return false unless str1.length == str2.length
  str2_arr = str2.chars
  str1_copy = str1.dup.chars
  str1.chars.each_with_index do |letter, idx|
    return false unless str2_arr.include?(letter)
    str2_arr.delete_at(str2_arr.index(letter)) if str2_arr.include?(letter)
  end
  true
end

# time complexity: O(n^2) Assuming that Array#index is O(n) since it iterates
# through the array of n elements to find the index value


def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# time complexity: O(n^2) or O(nlogn) for average/best case if ruby uses quicksort
# since avearage and best case are a lot better than second method, third is slightly better

def fourth_anagram?(str1, str2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  str1.chars.each do |letter|
    hash_1[letter] += 1
  end

  str2.chars.each do |letter|
    hash_2[letter] += 1
  end

  hash_1 == hash_2
end

# time complexity: O(n). Time taken to iterate through one array depends on
# size of array: n. Doing this a fixed number times still results in O(n).

# BONUS

def fourth_anagram_bonus?(str1, str2)
  hash = Hash.new(0)

  str1.chars.each do |letter|
    hash[letter] += 1
  end

  str2.chars.each do |letter|
    hash[letter] -= 1
  end

  hash.values.all? { |v| v == 0 }
end

# same time complexity O(n)
