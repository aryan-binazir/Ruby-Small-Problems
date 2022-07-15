class Board
  CENTER_SQUARE = 5
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def get_value(num)
    @squares[num].marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != TTTGame::NUMBER_FOR_ROUND
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name
  attr_reader :score

  def initialize
    @marker = nil
    @score = 0
    @name = nil
  end

  def increment_score
    @score += 1
  end

  def reset
    @score = 0
  end
end

class Human < Player
  def set_human_name
    answer = nil
    loop do
      puts "What is your name? "
      answer = gets.chomp
      if answer != ''
        self.name = answer
        break
      end
      puts "Name cannot be blank..."
    end
  end

  def set_marker
    loop do
      puts "Please select a marker except 'O' that is a single character:"
      answer = gets.chomp
      if answer.downcase != Computer::DEFAULT_MARKER.downcase &&
         answer.size == 1
        self.marker = answer
        break
      end
      puts "That is not a valid answer..."
    end
  end
end

class Computer < Player
  DEFAULT_MARKER = "O"

  def initialize
    @marker = DEFAULT_MARKER
    @score = 0
    @name = nil
  end

  def change_computer_name(human_name)
    answer = nil
    loop do
      puts "What is the computer's name? "
      answer = gets.chomp
      if answer != '' && answer != human_name
        self.name = answer
        break
      end
      puts "The computer's name cannot be blank or the same as your name..."
    end
  end
end

class TTTGame
  NUMBER_FOR_CHAMPION = 5
  NUMBER_FOR_ROUND = 3
  WHO_GOES_VALID_OPTIONS = ['1', '2', '3']
  HUMAN_FIRST = "1"
  COMPUTER_FIRST = "2"
  RANDOM = "3"

  attr_reader :board, :human, :computer, :first_to_move

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = nil
    @first_to_move = nil
  end

  def play
    clear
    display_welcome_message
    set_player_markers
    set_player_names
    who_goes_first?
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      single_championship_game
      display_champion
      break unless play_again?
      entire_game_reset
    end
  end

  def single_championship_game
    loop do
      display_score
      display_board
      player_move
      display_result
      increment_score
      break if champion?
      continue_and_clear
      single_game_reset
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      if human_turn?
        clear
        display_score
        display_board
      end
    end
  end

  def who_goes_first?
    answer = nil
    loop do
      display_who_first
      answer = gets.chomp
      adjust_markers(answer)
      clear
      break if WHO_GOES_VALID_OPTIONS.include?(answer)
      puts "That is not a value input, please select 1, 2 or 3."
    end
  end

  def display_who_first
    puts "Which player would you like to go first?"
    puts "#{HUMAN_FIRST}. #{human.name}"
    puts "#{COMPUTER_FIRST}. #{computer.name}"
    puts "#{RANDOM}. Random"
  end

  def adjust_markers(answer)
    if answer == HUMAN_FIRST
      chosen = human.marker
    elsif answer == COMPUTER_FIRST
      chosen = computer.marker
    elsif answer == RANDOM
      chosen = [human.marker, computer.marker].sample
    end
    @current_marker = chosen
    @first_to_move = chosen
  end

  def set_player_names
    human.set_human_name
    computer.change_computer_name(human.name)
  end

  def set_player_markers
    human.set_marker
    computer.marker = computer.marker
  end

  def increment_score
    if board.winning_marker == human.marker
      human.increment_score
    elsif board.winning_marker == computer.marker
      computer.increment_score
    end
  end

  def display_score
    puts "#{human.name} has #{human.score} wins"
    puts "#{computer.name} has #{computer.score} wins"
    puts ""
  end

  def champion?
    human.score == NUMBER_FOR_CHAMPION ||
      computer.score == NUMBER_FOR_CHAMPION
  end

  def display_champion
    if human.score == NUMBER_FOR_CHAMPION
      puts "You are the overall Champion!!!"
    elsif computer.score == NUMBER_FOR_CHAMPION
      puts "Computer is the overall Champion!!!"
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "    First player to get 3 in a row either vertically, horizontally
    or diagonally wins the round! First to win 5 rounds is the champion!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def continue_and_clear
    puts "Press enter to continue..."
    gets.chomp
    clear
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "#{human.name} is a #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def joinor(input_arr, delim = ', ', final_delim = 'or')
    return input_arr[0] if input_arr.size == 1
    return input_arr.join(' or ') if input_arr.size == 2
    input_arr[0..-2].join(delim) + delim + final_delim + ' ' +
      input_arr[-1].to_s
  end

  def human_moves
    puts "Choose a square (#{available_squares}): "
    square = nil
    loop do
      square = gets.chomp.to_f
      break if board.unmarked_keys.include?(square.to_i) &&
               square.to_i == square
      puts "Sorry, that's not a valid choice."
    end
    board[square.to_i] = human.marker
  end

  def available_squares
    joinor(board.unmarked_keys)
  end

  def computer_moves
    played = false
    square = find_best_square_available
    if !square.nil?
      board[square] = computer.marker
      played = true
    end
    board[board.unmarked_keys.sample] = computer.marker unless played
  end

  def find_best_square_available
    square = search_winning_lines(computer.marker)
    square = search_winning_lines(human.marker) if square.nil?
    square = Board::CENTER_SQUARE if square.nil? &&
                              board.get_value(Board::CENTER_SQUARE) == ' '
    square
  end

  def search_winning_lines(marker)
    Board::WINNING_LINES.each do |line|
      square = find_best_square(line, marker)
      return square if !square.nil?
    end
    nil
  end

  def find_best_square(line, marker)
    count = 0

    line.each { |num| count += 1 if board.get_value(num) == marker }
    if count == (NUMBER_FOR_ROUND - 1)
      return (line.select { |num| board.get_value(num) == ' ' })[0]
    end
    nil
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def clear
    system "clear"
  end

  def single_game_reset
    board.reset
    @current_marker = first_to_move
    clear
  end

  def entire_game_reset
    human.reset
    computer.reset
    board.reset
    @current_marker = first_to_move
    clear
  end
end

game = TTTGame.new
game.play
