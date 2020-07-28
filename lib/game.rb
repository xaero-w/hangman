class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end
  #--/--
  def normalize_letter(letter) # Заменяет букву ввода пользователя
    if letter == "Й"
      "И"
    elsif letter == "Ё"
      "Е"
    else
      letter
    end
  end

  def normalized_letters # Заменяет буквы в слове
    normalized_letters =
      @letters.map do |letter|
        normalize_letter(letter)
      end

    normalized_letters
  end

  def errors
    @user_guesses - normalized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      normalized_letters.map do |letter|
        if @user_guesses.include?(letter)
          letter
        else
          nil
        end
      end

    return result
  end

  def lost?
    return errors_allowed == 0
  end

  def over?
    return won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << normalize_letter(letter)
    end
  end

  def won?
    (normalized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
