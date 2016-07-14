# # # Even Splitters
# # # ------------------------------------------------------------------------------
# # # Return an array of characters on which we can split an input string to produce
# # # substrings of the same length.

# # # Don't count empty strings after the split.

# # # Here's an example for "banana":
# # #
# # # "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# # # "banana".split("b") # => ["", anana"] (all elements same length - there's only
# # # one element "anana" because the empty string doesn't count)
# # # "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
# # #
# # # result: ["b", "a"]
# # #
# # # ------------------------------------------------------------------------------

def even_splitters(string)
  results = []
  letters = string.chars.uniq
  letters.each do |letter|
    substr = string.split(letter)
    substr.delete('')
    results << letter if substr.all? { |arr| arr.size == substr.first.size }
  end
  results
end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]


# # # Isogram Matcher
# # # ------------------------------------------------------------------------------
# # # An isogram is a word with only unique, non-repeating letters. Given two isograms
# # # of the same length, return an array with two numbers indicating matches:
# # # the first number is the number of letters matched in both words at the same position,
# # # and the second is the number of letters matched in both words but not in the
# # # same position.

def isogram_matcher(isogram1, isogram2)
  match_at_index = 0
  match = 0
  isogram1.chars.each_with_index do |letter1, idx1|
    isogram2.chars.each_with_index do |letter2, idx2|
      match_at_index += 1 if letter1 == letter2 && idx1 == idx2
      match += 1 if letter1 == letter2
    end
  end
  [match_at_index, match-match_at_index]
end

puts "-------Isogram Matcher-------"
puts isogram_matcher("an", "at") == [1, 0]
puts isogram_matcher("or", "go") == [0, 1]
puts isogram_matcher("cat", "car") == [2, 0]
puts isogram_matcher("cat", "tap") == [1, 1]
puts isogram_matcher("home", "dome") == [3, 0]
puts isogram_matcher("gains", "snake") == [0, 3]
puts isogram_matcher("glamourize", "blueprints") == [1, 4]
puts isogram_matcher("ultrasonic", "ostracized") == [3, 4]
puts isogram_matcher("unpredictably", "hydromagnetic") == [1, 8]


# # # Xbonacci
# # # ------------------------------------------------------------------------------

# # # Write a Xbonacci function that works similarly to the fibonacci sequence.
# # # The fibonacci sequence takes the last two numbers in the sequence and adds
# # # them together to create the next number.
# # #
# # # First five fibonacci numbers = [1, 1, 2, 3, 5]
# # # The fourth fibonacci number (3) is the sum of the two numbers before it
# # # (1 and 2).
# # #
# # # In Xbonacci, the sum of the last X numbers (instead of the last 2 numbers)
# # # of the sequence becomes the next number in the sequence.
# # #
# # # The method will take two inputs: the starting sequence with X number of
# # # elements and an integer N, and return the first N elements in the given
# # # sequence.  Take a look at the test cases for examples.
# # #
# # # In the code, how_many_numbers_to_sum is the same as X (name your variables
# # # descriptively!).
# # #
# # # In the code, number_of_fibonacci_numbers_to_return is the same as N.

def xbonacci(starting_sequence, number_of_fibonacci_numbers_to_return)
  number_to_sum = starting_sequence.size
  until starting_sequence.size == number_of_fibonacci_numbers_to_return
    starting_sequence << starting_sequence.reverse[0...number_to_sum].inject(:+)
  end
  starting_sequence
end

puts "-------Xbonacci-------"
puts xbonacci([1, 1], 5) == [1, 1, 2, 3, 5]
puts xbonacci([1, 1, 1], 6) == [1, 1, 1, 3, 5, 9]
puts xbonacci([1, 1, 1, 1], 8) == [1, 1, 1, 1, 4, 7, 13, 25]
puts xbonacci([1, 1, 1, 1, 1, 1], 10) == [1, 1, 1, 1, 1, 1, 6, 11, 21, 41]
puts xbonacci([0, 0, 0, 0, 1], 10) == [0, 0, 0, 0, 1, 1, 2, 4, 8, 16]


# # #  Cupcake Solver
# # #------------------------------------------------------------------------------
# # # It's Jennifer's birthday today. Jennifer's mom decided to bake different kinds
# # # of cupcakes for Jennifer's first grade class.  Everybody needs to have an equal
# # # amount of the different kinds of cupcakes.

# # # Write a method that takes an array of the counts of the different kinds of
# # # cupcakes and the number of students in the class, and returns
# # # the total number of cupcakes that each student in the class
# # # should get.

# # # Every student should have equal amounts of every kind of cupcake.
# # # No student gets to have more cupcakes than the others.  There can be leftover
# # # cupcakes.

# # # An array of [1, 2, 3] means that there's one red velvet cupcake,
# # # two vanilla cupcakes, and three chocolate cupcakes.

# # # Example: cupcake_solver([10, 10, 10], 5) == 6  means that there are five
# # # students in the class, and each student gets to eat six cupcakes, total.


def cupcake_solver(cupcake_counts, number_of_students_in_class)
  cupcake_counts.map { |number| number / number_of_students_in_class }.inject(:+)
end


puts "-------Cupcake Solver-------"
puts cupcake_solver([10, 10, 10], 5) == 6
puts cupcake_solver([25, 27, 30], 5) == 16
puts cupcake_solver([32, 27, 28], 20) == 3
puts cupcake_solver([32, 27, 28, 24], 20) == 4


# # # # In All Strings
# # # # ------------------------------------------------------------------------------
# # # # Check if a short_string is a substring of ALL of the long_strings

def in_all_strings?(long_strings, short_string)
  long_strings.all? {|string| string.include?(short_string)}
end

puts "---------In All Strings-------"
puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "sisa") == true
puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "isan") == false
puts in_all_strings?(["gandalf", "aragorn", "sauron"], "sam") == false
puts in_all_strings?(["axe", "ajax", "axl rose"], "ax") == true

def chunk(array, n)
  arr = []
  arr << array.shift(n) until array.empty?
  arr
end

puts "---------chunk-------"
puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# # # # Remove the nth letter of the string
def remove_nth_letter(string, n)
  arr = string.chars  
  arr.delete_at(n)
  arr.join
end

puts "---------remove nth letter-------"
puts remove_nth_letter("helloworld", 5) == "helloorld"
puts remove_nth_letter("helloworld", -3) == "hellowold"
puts remove_nth_letter("thisisaniris", 2) == "thsisaniris"


# # # # count the number of times that two adjacent numbers in an array add up to n.
# # # # You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)
  results = []
  until array.size < 2
    array[0] + array[1] == n ? results << array.shift(2) : array.shift
  end
  results.count
end

puts "---------count adjacent sums-------"
puts count_adjacent_sums([7, 2, 4, 6, 8, 10], 7) == 0
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13) == 3
puts count_adjacent_sums([1, 9, 1, 8, 2, 10], 10) == 2
puts count_adjacent_sums([1, 9, 1, 9, 8, 2, 10], 10) == 3
puts count_adjacent_sums([1, 9, 1, 9, 8, 2, 10, 0], 10) == 4
puts count_adjacent_sums([1, 9, 1, 9, 1, 9, 8, 2, 10, 0], 10) == 5


# # # # Word With Most Repeats
# # # # ------------------------------------------------------------------------------
# # # # Given a sentence, find which word has the greatest amount of repeated letters.
# # # #
# # # # For example, "I took the road less traveled and that has made all the difference"
# # # # should return "difference" because it has two repeated letters (f and e).
# # # #
# # # # All words will be separated by spaces and there will be no punctuation or
# # # # capitalization.  If there is a tie return the first word

def word_with_most_repeats(sentence)
  hash = Hash.new(0)
  sentence.split.each { |word| hash[word] = count_letters(word) }
  hash.max_by { |word, max_letter| max_letter }.first
end

def count_letters(word)
  count = Hash.new(0)
  word.chars.each { |letter| count[letter] += 1 }
  count.values.max 
end

puts "-------Word With Most Repeats-------"
puts word_with_most_repeats('good luck') == 'good'
puts word_with_most_repeats('what if there is a tie betwixt words') == 'there'

