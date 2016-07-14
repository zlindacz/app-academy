def hashtagify(sentence, words)

end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Learned about coding. Coding is fun!", ["coding", "fun"]) == "Learned about #coding. #Coding is #fun!"

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
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

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

def caesar_guesser(encrypted_string, alphabet)

end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

puts "----Caesar Guesser-----"
puts caesar_guesser("a", alphabet) == "e"
puts caesar_guesser("b", alphabet) == "e"
puts caesar_guesser("ruuauufuh", alphabet) == "beekeeper"
puts caesar_guesser("mnonwmcqntnny", alphabet) == "defendthekeep"
puts caesar_guesser("happdaiawpywga", alphabet) == "letthemeatcake"

def cats_in_hats

end

p cats_in_hats


def pig_latin(sentence)

end

puts "---------pig latin-------"
puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"
puts pig_latin("square quilt queen") == "aresquay iltquay eenquay"


def inventory_array(older, newer)

end
puts "---------inventory array-------"
march_array = [['diamonds', 2], ['emeralds', 14], ['rubies', 10]]
april_array = [['emeralds', 27], ['moonstones', 5]]
puts inventory_array(march_array, april_array) == [['diamonds', 2], ['emeralds', 27], ['moonstones', 5], ['rubies', 10]]

def largest_odd_factors(nums)

end

# ------------------------------------------------------------------------------
puts "-------Largest Odd Factor-------"
puts largest_odd_factors([]) == []
puts largest_odd_factors([5]) == [1]
puts largest_odd_factors([8]) == [1]
puts largest_odd_factors([26, 27, 28, 29]) == [13, 9, 7, 1]
puts largest_odd_factors([10, 20, 30]) == [5, 5, 15]
# ------------------------------------------------------------------------------

def fibs(n)

end

# ------------------------------------------------------------------------------
puts "-------Fibonacci-------"
puts fibs(0) == []
puts fibs(1) == [0]
puts fibs(2) == [0, 1]
puts fibs(3) == [0, 1, 1]
puts fibs(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# ------------------------------------------------------------------------------

def hipsterfy(str)

end

# ------------------------------------------------------------------------------
puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("squeaker") == "squeakr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("proper tonic panther") == "propr tonc panthr"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("runner anaconda") == "runnr anacond"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"

def repeated_chars(word)

end

# ------------------------------------------------------------------------------
puts "-------Repeated Chars-------"
puts repeated_chars("cat") == []
puts repeated_chars("caat") == ['a']
puts repeated_chars("applle") == ['p', 'l']
puts repeated_chars("mississippi") == ['s', 's', 'p']
puts repeated_chars("caataapulllllt") == ['a', 'a', 'l']

def serial_killer_summary(calendar_of_murderers)

end


puts "-------Serial Killer Summary-------"

crime_calendar_1 = [
  "Bald Vinnie",
  "Fat Tony",
  "Bald Vinnie",
  "Bald Vinnie",
  "Fat Tony"
]

serial_killer_counts_1 = {
  "Bald Vinnie" => [[2, 3]]
}

crime_calendar_2 = [
  "Bald Vinnie",
  "Bald Vinnie",
  "Saucy Michael",
  "Fat Tony",
  "Fat Tony",
  "Bald Vinnie",
  "Bald Vinnie",
  "Bald Vinnie",
  "Fat Tony",
  "Slim Lorenzo"
]

serial_killer_counts_2 = {
  "Bald Vinnie" => [[0, 1], [5, 7]],
  "Fat Tony" => [[3, 4]]
}

puts serial_killer_summary(crime_calendar_1) == serial_killer_counts_1
puts serial_killer_summary(crime_calendar_2) == serial_killer_counts_2
