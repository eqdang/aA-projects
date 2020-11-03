class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

# PART 1

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(["_"] * @secret_word.length)
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index do |ltr, i|
      indices << i if ltr == char
    end

    indices
  end

  def fill_indices(char, arr_of_indices)
    arr_of_indices.each do |idx|
      @guess_word[idx] = char
    end
  end

# PART 2

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char 
  
    arr_of_indices = self.get_matching_indices(char)
    self.fill_indices(char, arr_of_indices)

    if self.get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    end
    
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    user_guess = gets.chomp
    return try_guess(user_guess)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end