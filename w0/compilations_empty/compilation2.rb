# # ##### longest palindrome #####

# # # Write a method that takes in a string of lowercase letters (no
# # # uppercase letters, no repeats). Consider the *substrings* of the
# # # string: consecutive sequences of letters contained inside the string.
# # # Find the longest such string of letters that is a palindrome.
# # #
# # # Note that the entire string may itself be a palindrome.
# # #
# # # You may want to use Array's `slice(start_index, length)` method,
# # # which returns a substring of length `length` starting at index
# # # `start_index`:
# # #
# # #     "abcd".slice(1, 2) == "bc"
# # #     "abcd".slice(1, 3) == "bcd"
# # #     "abcd".slice(2, 1) == "c"
# # #     "abcd".slice(2, 2) == "cd"


def longest_palindrome(string)

end


puts '--- longest palindrome ---'
p longest_palindrome('abcbd') == 'bcb'
p longest_palindrome('abba') == 'abba'
p longest_palindrome('abcbdeffe') == 'effe'


# # ##### dasherize #####

# # # Write a method that takes in a number and returns a string, placing
# # # a single dash before and after each odd digit. There is one
# # # exception: don't start or end the string with a dash.
# # #
# # # You may wish to use the `%` modulo operation; you can see if a number
# # # is even if it has zero remainder when divided by two.

def dasherize_number(num)

end

puts '--- dasherize ---'
p dasherize_number(203) == '20-3'
p dasherize_number(303) == '3-0-3'
p dasherize_number(333) == '3-3-3'
p dasherize_number(3223) == '3-22-3'

# # ##### nearby az #####

# # # Write a method that takes a string in and returns true if the letter
# # # "z" appears within three letters **after** an "a". You may assume
# # # that the string contains only lowercase letters.

def nearby_az(string)

end

p '----- neaby az -----'
p nearby_az('baz') == true
p nearby_az('abz') == true
p nearby_az('abcz') == true
p nearby_az('a') == false
p nearby_az('z') == false
p nearby_az('za') == false

# # # Hashtagify
# # # ------------------------------------------------------------------------------
# # # Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# # # in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, words)

end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Learned about coding. Coding is fun!", ["coding", "fun"]) == "Learned about #coding. #Coding is #fun!"

# # # Range Summary
# # # ------------------------------------------------------------------------------
# # # Given a sorted array of integers without duplicates, return the start and end
# # # integers of number ranges found in the array. A number range is considered valid
# # # when all numbers from start to end are contiguous and only increment by 1.
# # # Assume all numbers are included as part of a range (no stand alone elements).

def range_summary(array)

end

puts "-------Range Summary-------"
puts range_summary([0, 1]) == [[0, 1]]
puts range_summary([0, 1, 4, 5]) == [[0, 1], [4, 5]]
puts range_summary([0, 1, 3, 4, 6, 7]) == [[0, 1], [3, 4], [6, 7]]
puts range_summary([0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16]) == [[0, 5], [7, 9], [15, 16]]


# # # Vigenere Cipher
# # # ------------------------------------------------------------------------------
# # # Caesar's cipher takes a word and encrypts it by offsetting each letter in
# # # the word by a fixed number, the key. For a key of 3, for example:
# # # a -> d, p -> s, and y -> b
# # #
# # # Vigenere's Cipher is a Caesar cipher, but instead of a single key, a sequence
# # # of keys is used. For example, if we encrypt "bananasinpajamas" with the
# # # key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
# # #
# # # Word:   b a n a n a s i n p a j a m a s
# # # Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # # Cipher: c c q b p d t k q q c m b o d t
# # #
# # # Write a method that takes a string and a key-sequence, returning
# # # the encrypted word.

# # # We're giving you the alphabet as an array if you need it.
# # # ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence)

end

puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toerrishuman", [1, 2, 3]) == "uqhstltjxncq"


# # # Caesar Guesser
# # # ------------------------------------------------------------------------------
# # # Caesar's cipher takes a word and encrypts it by offsetting each letter in
# # # the word by a fixed number, the key. For a key of 3, for example:
# # # a -> d, p -> s, and y -> b.
# # #
# # # Given that the most common letter in english is 'E', build a decrypter that
# # # takes an encrypted word, determines the key, and returns the decrypted word.
# # #
# # # Strategy: find the most common letter in the encrypted string and assume that it
# # # should be the letter "e" in the decrypted string. Use this information to
# # # calculate the key.  Use helper functions to declutter your code.

# # # We're giving you the alphabet as an array if you need it.
# # # ------------------------------------------------------------------------------

ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

def caesar_guesser(encrypted_string, alphabet)

end

puts "----Caesar Guesser-----"
puts caesar_guesser("a", alphabet) == "e"
puts caesar_guesser("b", alphabet) == "e"
puts caesar_guesser("ruuauufuh", alphabet) == "beekeeper"
puts caesar_guesser("mnonwmcqntnny", alphabet) == "defendthekeep"
puts caesar_guesser("happdaiawpywga", alphabet) == "letthemeatcake"

# # # In All Strings
# # # ------------------------------------------------------------------------------
# # # Check if a short_string is a substring of ALL of the long_strings

def in_all_strings?(long_strings, short_string)

end

puts "---------In All Strings-------"
puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "sisa") == true
puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "isan") == false
puts in_all_strings?(["gandalf", "aragorn", "sauron"], "sam") == false
puts in_all_strings?(["axe", "ajax", "axl rose"], "ax") == true

# # # Biodiversity
# # # ------------------------------------------------------------------------------
# # # Given an array of specimens, return the biodiversity index, which is defined
# # # by the following formula:
# # #
# # # biodiversity = number_of_species**2 * smallest_population_size / largest_population_size
# # #
# # # ------------------------------------------------------------------------------

def biodiversity_index(specimens)

end

puts "------Biodiversity------"
puts biodiversity_index(["cat"]) == 1
puts biodiversity_index(["cat", "cat", "cat"]) == 1
puts biodiversity_index(["cat", "cat", "dog"]) == 2
puts biodiversity_index(["cat", "fly", "dog"]) == 9
puts biodiversity_index(["cat", "fly", "dog", "dog", "cat", "cat"]) == 3
