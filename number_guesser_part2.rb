class Game
  MAX_GUESSES = 7
  VALID_CHOICES = %w(y yes n no).freeze

  attr_accessor :guesses_had, :current_guess
  attr_reader :winning_number, :low, :high

  def initialize(low, high)
    @winning_number = nil
    @guesses_had = nil
    @current_guess = nil
    @low = low
    @high = high
  end

  def play
    loop do
      game_reset
      single_game
      break unless play_again?
    end
    display_goodbye
  end

  def single_game
    @guesses_had = 0
    loop do
      clear
      display_turns_left
      self.current_guess = set_player_guess
      self.guesses_had += 1
      give_feedback_on_guess
      if won?
        display_won
        break
      end
      if guesses_had == MAX_GUESSES
        display_lost
        break
      end
    end
  end

  def give_feedback_on_guess
    if current_guess > winning_number
      puts 'Your guess is too High.'
    elsif current_guess < winning_number
      puts 'Your guess is too low.'
    end
    continue unless won?
  end

  def display_turns_left
    turns_left = MAX_GUESSES - guesses_had
    puts "You have #{turns_left} guesses left!"
  end

  def clear
    system 'clear'
  end

  def game_reset
    @winning_number = (low..high).to_a.sample
    @current_guess = nil
  end

  def won?
    current_guess == winning_number
  end

  def display_won
    puts 'You won!'
  end

  def display_lost
    puts 'You lost!'
    puts "The winning number was #{winning_number}"
  end

  def display_goodbye
    puts 'Thanks for playing, Goodbye!'
  end

  def play_again?
    answer = nil
    loop do
      puts 'would you like to play again? (y/n)'
      answer = gets.chomp
      break if VALID_CHOICES.include?(answer.downcase)

      clear
      puts 'Sorry, that is not a valid choice!'
    end
    answer.downcase.start_with?('y')
  end

  def continue
    puts 'Press the enter key to continue...'
    gets.chomp
  end

  def set_player_guess
    guess = nil
    puts "Enter a number between #{self.low} and #{self.high}: "
    loop do
      guess = gets.chomp.to_i
      break if guess >= self.low && guess <= self.high

      puts "That input is incorrect, Enter a number between #{self.low} and #{self.high}: "
    end
    self.current_guess = guess
  end
end

new_game = Game.new(501, 5000)
new_game.play

