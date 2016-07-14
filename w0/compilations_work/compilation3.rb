# # ### Cats 'n Hats ###
# # # You have 100 cats (You are quite lucky to own so many cats!).

# # # You have arranged all your cats in a line. Initially, none of your cats
# # # have any hats. You take 100 rounds walking around the cats, always starting
# # # at the beginning. Every time you stop at a cat, you put a hat on it if it
# # # doesn't have one, and you take its hat off if it has one on.

# # # The first round, you stop at every cat. The second round, you only stop at
# # # every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at
# # # every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the
# # # 100th round (i.e. you only visit the 100th cat).

# # # Write a program that prints which cats have hats at the end.

# # ################################

def cats_in_hats

end

p cats_in_hats


# # # chunk an array into nested arrays of length n

def chunk(array, n)

end

puts "---------chunk-------"
puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# # # Translate into pig-latin! First consonants go to the end of a word. End with "ay"
# # def pig_latin(sentence)
# #   piggy = sentence.split.map do |word|
# #     split_on = word =~ /[aeiou]/
# #     word = word[split_on...word.length] + word[0...split_on] + 'ay'
# #   end
# #   piggy.join(' ')
# # end

def pig_latin(sentence)

end

puts "---------pig latin-------"
puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"
puts pig_latin("square quilt queen") == "aresquay iltquay eenquay"

# # # Remove the nth letter of the string
def remove_nth_letter(string, n)

end

puts "---------remove nth letter-------"
puts remove_nth_letter("helloworld", 5) == "helloorld"
puts remove_nth_letter("helloworld", -3) == "hellowold"
puts remove_nth_letter("thisisaniris", 2) == "thsisaniris"

# # # Boolean function: check if short_string is a substring of long_string
def substring?(long_string, short_string)

end

puts "---------substring-------"
puts substring?("thisisaverylongstring", "sisa") == true
puts substring?("thisisaverylongstring", "ting") == false
puts substring?("whatifikeptontypingforever", "ik") == true

# # # count the number of times that two adjacent numbers in an array add up to n.
# # # You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)

end

puts "---------count adjacent sums-------"
puts count_adjacent_sums([7, 2, 4, 6, 8, 10], 7) == 0
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13) == 3
puts count_adjacent_sums([1, 9, 1, 8, 2, 10], 10) == 2
puts count_adjacent_sums([1, 9, 1, 9, 8, 2, 10], 10) == 3
puts count_adjacent_sums([1, 9, 1, 9, 8, 2, 10, 0], 10) == 4
puts count_adjacent_sums([1, 9, 1, 9, 1, 9, 8, 2, 10, 0], 10) == 5


# # # update the older inventory with the newer inventory. Add any new items to the
# # # hash and replace the values for items that already exist.

def inventory_hash(older, newer)

end

puts "---------inventory hash-------"
march = {rubies: 10, emeralds: 14, diamonds: 2}
april = {emeralds: 27, moonstones: 5}
puts inventory_hash(march, april) == {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}

# # # Now, alphabetical order matters in your inventory. Insert new inventory items into
# # # your array in the appropriate place
def inventory_array(older, newer)

end

puts "---------inventory array-------"
march_array = [['diamonds', 2], ['emeralds', 14], ['rubies', 10]]
april_array = [['emeralds', 27], ['moonstones', 5]]
puts inventory_array(march_array, april_array) == [['diamonds', 2], ['emeralds', 27], ['moonstones', 5], ['rubies', 10]]


# # # ------------------------------------------------------------------------------

# # # Word With Most Repeats
# # # ------------------------------------------------------------------------------
# # # Given a sentence, find which word has the greatest amount of repeated letters.
# # #
# # # For example, "I took the road less traveled and that has made all the difference"
# # # should return "difference" because it has two repeated letters (f and e).
# # #
# # # All words will be separated by spaces and there will be no punctuation or
# # # capitalization.  If there is a tie return the first word

def word_with_most_repeats(sentence)

end

puts "-------Word With Most Repeats-------"
puts word_with_most_repeats('good luck') == 'good'
puts word_with_most_repeats('what if there is a tie betwixt words') == 'there'
