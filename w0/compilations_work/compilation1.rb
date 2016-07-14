def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true
    arr.each_with_index do |num, idx|
      if idx < arr.length-1 && num > arr[idx+1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        sorted = false
      end
    end
  end

  arr
end

p '----- bubble sort -----'
p bubble_sort([])
p bubble_sort([1])
p bubble_sort([5, 4, 3, 2, 1])
p bubble_sort([6, 3, 6, 7, 9, 1, 9, 1])


# # ##### word unscrambler #####
# # # Write a function word_unscrambler that takes two inputs: a scrambled
# # # word and a dictionary of real words.  Your program must then output
# # # all words that our scrambled word can unscramble to.

def word_unscrambler(str, words)
  words.select { |word| word.chars.sort.join == str.chars.sort.join }
end

p '----- word unscrambler -----'
p word_unscrambler("cat", ["tac"])  == ["tac"]
p word_unscrambler("cat", ["tom"]) == []
p word_unscrambler("cat", ["tic", "toc", "tac", "toe"]) == ["tac"]
p word_unscrambler("cat", ["scatter", "tac", "ca"] ) == ["tac"]
p word_unscrambler("turn", ["numb", "turn", "runt", "nurt"]) == ["turn", "runt", "nurt"]

# # ##### morse code #####

# # # Build a function, `morse_encode(str)` that takes in a string (no
# # # numbers or punctuation) and outputs the morse code for it. See
# # # http://en.wikipedia.org/wiki/Morse_code. Put two spaces between
# # # words and one space between letters.
# # #
# # # You'll have to type in morse code: I'd use a hash to map letters to
# # # codes. Don't worry about numbers.
# # #
# # # I wrote a helper method `morse_encode_word(word)` that handled a
# # # single word.

MORSE_CODE = ('a'..'z').to_a.zip([".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.",
              "...","-","..-","...-",".--","-..-","-.--","--.."]).to_h
def morse_encode(str)
  str.split.map { |word| morsify(word) }.join('  ')
end

def morsify(word)
  word.chars.map { |letter| MORSE_CODE[letter] }.join(' ')
end

p '----- Morse Code -----'
p morse_encode("q") == "--.-"
p morse_encode("cat") == "-.-. .- -"
p morse_encode("cat in hat") == "-.-. .- -  .. -.  .... .- -"


# # ##### wonky coins #####

# # # Catsylvanian money is a strange thing: they have a coin for every
# # # denomination (including zero!). A wonky change machine in
# # # Catsylvania takes any coin of value N and returns 3 new coins,
# # # valued at N/2, N/3 and N/4 (rounding down).
# # #
# # # Write a method `wonky_coins(n)` that returns the number of coins you
# # # are left with if you take all non-zero coins and keep feeding them
# # # back into the machine until you are left with only zero-value coins.

def wonky_coins(n)
  return 1 if n == 0
  wonky_coins(n/2) + wonky_coins(n/3) + wonky_coins(n/4)
end

p '----- wonky coins -----'
p wonky_coins(1) == 3
p wonky_coins(5) == 11
p wonky_coins(6) == 15
p wonky_coins(0) == 1


# # ##### ordered vowels #####

# # # Write a method, `ordered_vowel_words(str)` that takes a string of
# # # lowercase words and returns a string with just the words containing
# # # all their vowels (excluding "y") in alphabetical order. Vowels may
# # # be repeated (`"afoot"` is an ordered vowel word).
# # #
# # # You will probably want a helper method, `ordered_vowel_word?(word)`
# # # which returns true/false if a word's vowels are ordered.

def ordered_vowel_words(str)
  str.split.select { |word| ordered_vowel?(word) }.join(' ')
end

def ordered_vowel?(word)
  vowels = word.chars.select { |letter| %w(a e i o u).include?(letter) }
  vowels.sort == vowels
end


puts '---ordered vowel---'
p ordered_vowel_words("amends") == "amends"
p ordered_vowel_words("complicated") == ""
p ordered_vowel_words("afoot") == "afoot"
p ordered_vowel_words("ham") == "ham"
p ordered_vowel_words("crypt") == "crypt"
p ordered_vowel_words("o") == "o"
p ordered_vowel_words("tamely") == "tamely"
p ordered_vowel_words("this is a test of the vowel ordering system") == "this is a test of the system"


# # ##### nearest larger #####

# # # Write a function, `nearest_larger(arr, i)` which takes an array and an
# # # index.  The function should return another index, `j`: this should
# # # satisfy:
# # #
# # # (a) `arr[i] < arr[j]`, AND
# # # (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
# # #
# # # In case of ties (see example below), choose the earliest (left-most)
# # # of the two indices. If no number in `arr` is larger than `arr[i]`,
# # # return `nil`.
def nearest_larger(arr, idx)
  i = idx - 1
  j = idx + 1
  loop do
    break if i < 0 && j >= arr.size
    return i if i >= 0 && arr[i] > arr[idx]
    return j if j < arr.size && arr[j] > arr[idx]
    i -= 1
    j += 1
  end
  nil
end

puts '--- nearest larger ---'
p nearest_larger([2,3,4,8], 2) == 3
p nearest_larger([2,8,4,3], 2) == 1
p nearest_larger([2,6,4,8], 2) == 1
p nearest_larger([2,6,4,6], 2) == 1
p nearest_larger([8,2,4,3], 2) == 0
p nearest_larger([8,2,4,3], 0) == nil
p nearest_larger([8,2,4,3,5,4,6,5,0,9], 6) == 9
p nearest_larger([2,2,4,4,4,4,6], 2) == 6
p nearest_larger([2,6,6,4,6], 3) == 2


# # ##### capitalize words #####

# # # Write a method that takes in a string of lowercase letters and
# # # spaces, producing a new string that capitalizes the first letter of
# # # each word.

def capitalize_words(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p '----- capitalize words -----'
p capitalize_words("this is a sentence") == "This Is A Sentence"
p capitalize_words("mike bloomfield") == "Mike Bloomfield"


# # ##### num repeats #####

# # # Write a method that takes in a string and returns the number of
# # # letters that appear more than once in the string. You may assume
# # # the string contains only lowercase letters. Count the number of
# # # letters that repeat, not the number of times they repeat in the
# # # string.

def num_repeats(string)
  repeated = Hash.new(0)
  string.chars.each { |letter| repeated[letter] += 1 }
  repeated.select { |k,v| v > 1 }.keys.count
end

p '----- num repeats -----'
p num_repeats('abdbc') == 1
p num_repeats('aaa') == 1
p num_repeats('abab') == 2
p num_repeats('cadac') == 2
p num_repeats('abcde') == 0

# # ##### caesar cipher #####

# # # Write a method that takes in an integer `offset` and a string.
# # # Produce a new string, where each letter is shifted by `offset`. You
# # # may assume that the string contains only lowercase letters and
# # # spaces.
# # #
# # # When shifting "z" by three letters, wrap around to the front of the
# # # alphabet to produce the letter "c".
# # #
# # # You'll want to use String's `ord` method and Integer's `chr` method.
# # # `ord` converts a letter to an ASCII number code. `chr` converts an
# # # ASCII number code to a letter.
# # #
# # # You may look at the ASCII printable characters chart:
# # #
# # #     http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
# # #
# # # Notice that the letter 'a' has code 97, 'b' has code 98, etc., up to
# # # 'z' having code 122.
# # #
# # # You may also want to use the `%` modulo operation to handle wrapping
# # # of "z" to the front of the alphabet.

ALPHABET = ('a'..'z').to_a

def caesar_cipher(offset, string)
  string.split.map { |word| caesar(offset, word) }.join(' ')
end

def caesar(offset, word)
  word.chars.map { |letter| ALPHABET[(ALPHABET.index(letter) + offset) % 26] }.join
end

puts '--- caesar cipher ---'
p caesar_cipher(3, 'abc') == 'def'
p caesar_cipher(3, 'abc xyz') == 'def abc'
p caesar_cipher(7, "abc xyz") == "hij efg"
