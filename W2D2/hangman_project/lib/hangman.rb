class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word 
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length,"_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted? (chr)
    attempted_chars.include?(chr)
  end

  def get_matching_indices (chr)
    indices = []
    @secret_word.each_char.with_index{|c, i| indices << i if c == chr}
    indices
  end

  def fill_indices (chr, arr_i)
    arr_i.each{|i| @guess_word[i] = chr}
  end

  def try_guess (chr)
    if already_attempted?(chr)
      p "that has already been attempted"
      false
    else
      @attempted_chars << chr
      indices = get_matching_indices(chr)
      if indices.length>0
        fill_indices(chr, indices)
      else
        @remaining_incorrect_guesses -=1
      end
      true
    end
  end

  def ask_user_for_guess()
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end
end
