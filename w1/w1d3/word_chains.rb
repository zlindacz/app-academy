require 'set'
class WordChainer
  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
  end

  # private

  def adjacent_words(current_word)
    adjacent = []
    # try with creating words with mutating each letter and include?
    # possible_words = current_word.chars.map { |letter| }
    same_length = dictionary.select { |word| word.length == current_word.length }
    same_length.each do |word|
      difference_counter = 0
      word.chars.each_with_index do |letter, idx|
        difference_counter += 1 unless letter == current_word.chars[idx]
      end
      adjacent << word if difference_counter == 1
    end
    adjacent
  end

  # def run(source, target)
  #   @current_words = [source]
  #   @all_seen_words = [source]
  #   until @current_words.empty?
  #     new_current_words = []
  #     @current_words.each do |current_word|
  #       adjacent_words(current_word).each do |adjacent|
  #         next if @all_seen_words.include?(adjacent)
  #         @all_seen_words << adjacent
  #         new_current_words << adjacent
  #       end
  #     end
  #     puts new_current_words
  #     @current_words = new_current_words
  #   end
  # end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]
    @current_words = explore_current_words until @current_words.empty?
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent|
        next if @all_seen_words.include?(adjacent)
        @all_seen_words << adjacent
        new_current_words << adjacent
      end
    end
    p new_current_words
  end
end

# if __FILE__ == $PROGRAM_NAME
  dictionary = File.read('dictionary.txt').split("\n").to_set
  words = WordChainer.new(dictionary)
  p words.run('duck', 'ruby')
  # p words.adjacent_words('cat')
# end
