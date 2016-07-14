require_relative 'player'
class Game
  attr_reader :name
  attr_accessor :current_player, :fragment

  def initialize(player1, player2, dictionary)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @dictionary = dictionary
    @fragment = ""
    @current_player = @player1
  end

  def play_round
    until over?
      @fragment << take_turn(current_player)
      next_player!
    end
    "#{Current_player} loses by making the word '#{fragment}'."
  end

  def over?
    dictionary.include?(fragment)
  end

  private

  def next_player!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def valid_play?(string)
    if !('a'..'z').cover?(letter)
      puts "That's not a letter."
      false
    elsif dictionary.none? { |word| /^#{fragment + letter}/.match(word).to_s == (fragment + letter) }
      puts "That will not make a word."
      false
    end
    true
  end

  def take_turn(player)
    loop do
      a_guess = player.guess
      return a_guess if valid_play?(a_guess)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Enter Player1's name."
  name_1 = gets.chomp
  puts "Enter Player2's name."
  name_2 = gets.chomp
  dictionary = File.read("dictionary.txt").split("\n")
  game = Game.new(name_1, name_2, dictionary)
  game.play_round
end
