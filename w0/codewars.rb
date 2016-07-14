require 'byebug'

puts "### Consecutive Strings ###"

def longest_consec(strarr, k)
  return "" unless k.between?(1, strarr.length)
  strarr.each_cons(k).map(&:join).max_by(&:length) || ""
end

p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3)
p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1)
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)

# def longest_consec(strarr, k)
#   return "" if strarr.empty? || k > strarr.length || k <= 0
#
#   combos = []
#   (0..strarr.length-k).each do |start|
#     combos << strarr.slice(start, k)
#   end
#   combos.map(&:join).max_by {|str| str.length}
# end

# puts "### Good VS Evil 2 ###"
#
# def score(side, values)
#   side.split(' ').map(&:to_i).map.with_index { |creature, idx| creature * values[idx] }.inject(:+)
# end
#
# def goodVsEvil(good, evil)
#   battle_score = score(good, [1, 2, 3, 3, 4, 10]) <=> score(evil, [1, 2, 2, 2, 3, 5, 10])
#   case battle_score
#     when 1 then "Battle Result: Good triumphs over Evil"
#     when 0 then "Battle Result: No victor on this battle field"
#     when -1 then"Battle Result: Evil eradicates all trace of Good"
#   end
# end
#
# puts "### Good VS Evil ###"
#
# def goodVsEvil(good, evil)
#   good_worth = [1, 2, 3, 3, 4, 10]
#   evil_worth = [1, 2, 2, 2, 3, 5, 10]
#
#   good_score = good.split(' ').map(&:to_i).zip(good_worth).map { |arr| arr.inject(&:*) }.inject(&:+)
#   evil_score = evil.split(' ').map(&:to_i).zip(evil_worth).map { |arr| arr.inject(&:*) }.inject(&:+)
#
#    if good_score > evil_score
#      "Battle Result: Good triumphs over Evil"
#    elsif good_score < evil_score
#      "Battle Result: Evil eradicates all trace of Good"
#    else
#      "Battle Result: No victor on this battle field"
#    end
# end

# p goodVsEvil('1 0 0 0 0 0', '1 0 0 0 0 0 0')
# p goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')
# p goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')


# puts "### Enigma Part 1 ###"
#
# class Plugboard
#   def initialize(wires="")
#     elsif wires.length > 20
#       raise "Too many wires defined"
#     elsif wires.chars.any? {|letter| wires.chars.count(letter) > 1}
#       raise "Cannot accept multiple definitions for a wire end"
#     end
#     @wires = wires.chars.uniq.each_slice(2).to_a.to_h
#   end
#
#   def process(wire)
#     if @wires.key?(wire)
#       @wires[wire]
#     elsif @wires.invert.key?(wire)
#       @wires.invert[wire]
#     else
#       wire
#     end
#   end
#
# end
#
# plugboard = Plugboard.new("ABCCD")
# p plugboard.process('AC')
