class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length){'_'}
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

  def already_attempted?(ch)
    @attempted_chars.include?(ch)
  end

  def get_matching_indices(ch)
    indices = []
    @secret_word.each_char.with_index {|char,i| indices << i if char == ch}
    indices
  end

  def fill_indices(ch, indices)
    indices.each {|i| @guess_word[i] = ch}
  end

  def try_guess(ch)
    if already_attempted?(ch)
      puts 'that has already been attempted'
      false
    else
      @attempted_chars << ch
      indices = get_matching_indices(ch)
      indices.empty? ? @remaining_incorrect_guesses -= 1 : fill_indices(ch, indices)
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    ch = gets.chomp
    try_guess(ch)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      true
    else
      false
    end
  end

end
