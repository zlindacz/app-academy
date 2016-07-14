
=begin
Write a function that takes an array of integers and returns
another array of the indices at which the direction of the 
integers changes. So if you have [1, 2, 4, 6, 5, 3, 4], the
output would be [3, 5] because those are the indices where
the numbers stop increasing and then where they stop decreasing.
If you have multiple repeating integers in a row, get them
as well. So for [1, 2, 4, 10, 10, 10, 10, 9, 6, 1, 3, 5], the
output would be [3, 6, 9]. (Numbers stop increasing at index 3,
stop being equal at index 6, and stop decreasing at index 9.)
If you're silly, create another function that outputs the
first and last indices of each section.... So instead of [3, 6, 9]
you'd get [[0, 3], [3, 6], [6, 9], [9, 10]]
=end

def direction_changes(arr)
  
end
​
puts direction_changes([2, 4, 8, 8, 8, 7]) == [2, 4]
puts direction_changes([]) == []
puts direction_changess([1]) == []
puts direction_changes([67, 42]) == []
puts direction_changes([57, 57, 57, 57, 57, 57, 45, 42, -1,
  -20, -16, 100, 99]) == [5, 9, 11]
​
def direction_changes_silly(arr)

end
​
puts direction_changes_silly([2, 4, 8, 8, 8, 7]) == [[0, 2], [2, 4],
  [4, 5]]
puts direction_changes_silly([]) == []
puts direction_changes_silly([1]) == []
puts direction_changes_silly([67, 42]) == [[0, 1]]
puts direction_changes_silly([57, 57, 57, 57, 57, 57, 45, 42, -1,
  -20, -16, 100, 99]) == [[0, 5], [5, 9], [9, 11], [11, 12]]

=begin
Here's another dumb idea.... Take a string of words separated by
spaces, remove all the vowels from all of the words, take those
vowels and put them in alphabetical order, then reinsert them
into the string, back in the same places they were before, but now
alphabetized. Ignore capitalization.
=end
​
def alphabetize_vowels(str)

end

​puts alphabetize_vowels("globule") == "glebolu"
puts alphabetize_vowels("Not looking forward to solving this") == "nat liiking forword to solvong thos"
puts alphabetize_vowels("Chunk_while is the best!") == "chenk_whele is thi bust!"
puts alphabetize_vowels("Some words will be the same") == "same werds well be thi somo"
puts alphabetize_vowels("Come on, shut it. that isn't cool.") == "came in, shit ot. thot osn't coul."

def censor(sentence)

end

#Write a function censor(sentence, curse_words) that censors the curse words. Replace certain vowels in the curse word with "*"
puts censor("Fuck you, bitch!", ["fuck", "bitch", "shit"]) == "F*ck you, b*tch!"
puts censor("I am so tired of this fucking shit", ["fuck", "bitch", "shit"]) == "I am so tired of this f*cking sh*t"


# Number Counting Sequence
# ------------------------------------------------------------------------------
# The number counting sequence is a sequence of number strings that begins with:
# ["1", "11", "21", "1211", "111221", ...]
#
# "1" is counted as "one 1" or "11", followed by
# "11" which is counted as "two 1s" or "21", followed by
# "21" which is counted as "one 2 and one 1" or "1211", and so on.
#
# It helps to "say it out loud" to describe the item in the sequence.
#
# Given an integer n, generate the n-th element in the number counting sequence.


def number_counting_seq(n)

end

puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11" # one 1 above
puts number_counting_seq(3) == "21" # two 1s above
puts number_counting_seq(5) == "111221" #the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"

#write a function largest_sum_pair that takes an array of intergers and returns the
#2 unique indices whose elements sum to the largest number. Formatted [earlier_index, later_index]

def largest_sum_pair(array)
  
end

puts "-----Largest Sum Pair----"
puts largest_sum_pair([1,2,3,4,5]) == [3,4]
puts largest_sum_pair([3,2,1,0,1,2,3]) == [0,6]
puts largest_sum_pair([-2,-1,-1,-2,-3]) == [1,2]


# Consecutive
# Take the array of integers stored in arr and return the minimum
# number of integers needed to make the contents of arr consecutive
# from the lowest number to the highest number. For example: If arr
# contains [4, 8, 6] then the output should be 2 because two numbers
# need to be added to the array (5 and 7) to make it a consecutive
# array of numbers from 4 to 8.

def consecutive(arr)

end

puts "------Consecutive----"
puts consecutive([5,10,15]) == 8
puts consecutive([2,10,4]) == 6

# Even Splitters
# ------------------------------------------------------------------------------
# Return an array of characters on which we can split an input string to produce
# substrings of the same length.

# Don't count empty strings after the split.

# Here's an example for "banana":
#
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]
#
# ------------------------------------------------------------------------------

def even_splitters(string)

end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]

# Fibonacci Checker
# If num is in the Fibonacci sequence, return true, else return false.
# The first two numbers are 0 and 1
# then comes 1, 2, 3, 5 etc.
# Fn = Fn-1 + Fn-2,

def fibonacci_checker(num)

end

puts "------Fibonacci Checker---------"
puts fibonacci_checker(34) == true
puts fibonacci_checker(54) == false

# Ordred vowels
# Write a method, ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).

def ordered_vowel_words(string)

end

phrase = "this is a test of the vowel ordering system"
result = "this is a test of the system"
puts "------Ordred Vowels---------"
puts ordered_vowel_words("complicated") == ""
puts ordered_vowel_words("afoot") == "afoot"
puts ordered_vowel_words(phrase) == result

