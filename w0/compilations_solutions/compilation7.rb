def price_is_right(bids, actual_retail_price)
  
end

p '----- price is right -----'
puts price_is_right([200, 2350, 1400, 1600], 1599) == 1400
puts price_is_right([950, 850, 1000, 1], 1300) == 1000


# # # Total Product Sequence
# # # ------------------------------------------------------------------------------
# # # The total product sequence starts with [1, 2, 3] as a "base case" (what you
# # # start with).  The next number in the sequence is the product of all the numbers
# # # before it.  Given a number n, find the nth number of the total product sequence.
# # #
# # # Assume n must be at least 1

def total_product_sequence(n)

end

p '----- total product sequence -----'
puts total_product_sequence(1) == 1
puts total_product_sequence(2) == 2
puts total_product_sequence(3) == 3
puts total_product_sequence(4) == 6 # 3 * 2 * 1
puts total_product_sequence(5) == 36 # 6 * 3 * 2 * 1
puts total_product_sequence(6) == 1296 # 36 * 6 * 3 * 2 * 1
puts total_product_sequence(8) == 2821109907456 # etc...

# # # # Products Except Me
# # # ------------------------------------------------------------------------------
# # #
# # # Given an array of numbers, calculate all the different products that remain when
# # # you take each element out of the array.
# # #
# # # Examples:
# # #
# # # [2, 3, 4] => [12, 8, 6], where:
# # #   12 because you take out 2, leaving 3 * 4
# # #   8, because you take out 3, leaving 2 * 4
# # #   6, because you take out 4, leaving 2 * 3
# # # ]
# # #
# # # [1, 2, 3, 5] => [30, 15, 10, 6], where:
# # #   30 because you take out 1, leaving 2 * 3 * 5
# # #   15, because you take out 2, leaving 1 * 3 * 5
# # #   10, because you take out 3, leaving 1 * 2 * 5
# # #   6, because you take out 5, leaving 1 * 2 * 3
# # # ]
# # #
# # #
# # #

def products_except_me(numbers)

end

p '----- products except me -----'
puts products_except_me([2, 3, 4]) == [12, 8, 6]
puts products_except_me([1, 2, 3, 5]) == [30, 15, 10, 6]
puts products_except_me([7, 2, 1, 4]) == [8, 28, 56, 14]


# # # Fall and Winter Birthdays
# # # ------------------------------------------------------------------------------
# # # Given a list of students and what month their birthday is, return all the pairs
# # # of students whose birthdays both fall in the second half of the year.  Months
# # # are numbers, and assume that July (month 7) and later is the second half of
# # # the year.
# # #
# # # Only count pairs once, and work from the beginning of the list to the end.
# # #

def fall_and_winter_birthdays(students_with_birthdays)

end

students_with_birthdays_1 = [
  ["Asher", 6],
  ["Bertie", 11],
  ["Dottie", 8],
  ["Warren", 9]
]

second_half_birthday_pairs_1 = [
  ["Bertie", "Dottie"],
  ["Bertie", "Warren"],
  ["Dottie", "Warren"]
]

students_with_birthdays_2 = [
  ["Asher", 6],
  ["Bertie", 11],
  ["Dottie", 8],
  ["Warren", 9],
  ["Charlie", 7],
  ["Nassim", 4],
  ["Ajit", 10],
]

second_half_birthday_pairs_2 = [
  ["Bertie", "Dottie"],
  ["Bertie", "Warren"],
  ["Bertie", "Charlie"],
  ["Bertie", "Ajit"],
  ["Dottie", "Warren"],
  ["Dottie", "Charlie"],
  ["Dottie", "Ajit"],
  ["Warren", "Charlie"],
  ["Warren", "Ajit"],
  ["Charlie", "Ajit"],
]

p '----- fall and winter birthdays -----'
puts fall_and_winter_birthdays(students_with_birthdays_1) == second_half_birthday_pairs_1
puts fall_and_winter_birthdays(students_with_birthdays_2) == second_half_birthday_pairs_2


# # # More than N Factors
# # # ------------------------------------------------------------------------------
# # # Given an array of numbers, return all the numbers that have at least N
# # # factors (including 1 and itself as factors).

# # # For example, if you were given [1, 3, 10, 16] and wanted to find the numbers
# # # that had at least five factors, you would return [16] because 16 has five
# # # factors (1, 2, 4, 8, 16) and the others have fewer than five factors.

def more_than_n_factors(numbers, n)
end

puts '----- more_than_n_factors -----'
puts more_than_n_factors([1, 3, 10, 16], 5) == [16]
puts more_than_n_factors([1, 3, 10, 16], 2) == [3, 10, 16]
puts more_than_n_factors([20, 36, 39, 16], 6) == [20, 36]


# # # One-week Wonders
# # # ------------------------------------------------------------------------------
# # # Given a list of songs at the top of the charts, return the songs that only
# # # stayed on the chart for a week at a time.
# # #
# # # Songs CAN reappear on the chart, as long as it's for a week at a time. Only
# # # count those songs once.
# # #
# # # Suggested strategy: find the songs that show up multiple times in a row and
# # # subtract them out.

def one_week_wonders(songs)
end

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

p '----- one week wonders -----'
puts one_week_wonders(top_hits_1) == one_week_wonders_1
puts one_week_wonders(top_hits_2) == one_week_wonders_2

# # # Sign Tweakers
# # # ------------------------------------------------------------------------------
# # # Given a perfectly respectable business sign, determine if pranksters George
# # # and Harold can make a vandalized sign out of it using the same or fewer letters.
# # # Ignore capitalization and punctuation.

def can_tweak_sign?(normal_sign, vandalized_sign)

end 


p '----- can tweak sign -----'
puts can_tweak_sign?("Come in and see our pretty armchairs", "Come and see our hairy armpits") == true
puts can_tweak_sign?("Student and teacher art fair starts Wed.", "Teacher farts stain underwear") == true
puts can_tweak_sign?("Choose the bread of life or you are toast", "Teacher farts stain underwear") == false


def total_product_sequence(n)

end

p '----- total product sequence -----'
puts total_product_sequence(1) == 1
puts total_product_sequence(2) == 2
puts total_product_sequence(3) == 3
puts total_product_sequence(4) == 6 # 3 * 2 * 1
puts total_product_sequence(5) == 36 # 6 * 3 * 2 * 1
puts total_product_sequence(6) == 1296 # 36 * 6 * 3 * 2 * 1
puts total_product_sequence(8) == 2821109907456 # etc...

