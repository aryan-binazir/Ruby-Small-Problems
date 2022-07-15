require 'yaml'

MESSAGES = YAML.load_file('tictactoe_messages.yml')
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ROUNDS_TO_WIN = 5
IN_A_ROW_TO_WIN = 3
VALID_YES = ["y", "yes"]
VALID_NO = ["n", "no"]
WHOS_TURN = { 1 => 'Player', 2 => 'Computer', 3 => 'Computer choice' }
MARKERS_URGENT = { 'markers' => 2, 'spaces' => 1 }
CHOICE = [1, 2]
CENTER_SQUARE = 5
MARKERS = [COMPUTER_MARKER, PLAYER_MARKER]

def clear
  system("clear")
end

def messages(message)
  puts(MESSAGES[message])
end

def integer?(number)
  number.to_i.to_s == number
end

def continue
  print "Press enter to continue\n"
  gets.chomp
end

def joinor(arr, delim = ', ', last_separator = 'or')
  output_str = ''
  return "#{arr[0]} #{last_separator} #{arr[1]}" if arr.size == 2
  arr.each do |num|
    output_str += num.to_s
    output_str += delim if num != arr.last
    output_str += last_separator + ' ' if num == arr[-2]
  end
  output_str
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITAL_MARKER }
end

def get_urgent_position(board)
  MARKERS.each do |marker|
    WINNING_LINES.each do |line|
      if board.values_at(*line).count(marker) == MARKERS_URGENT['markers'] &&
         board.values_at(*line).count(" ") == MARKERS_URGENT['spaces']
        line.each do |position|
          return position if board[position] == " "
        end
      end
    end
  end
  nil
end

def center_square_available?(square, board)
  !square && board[CENTER_SQUARE] == " "
end

def pick_random_square(board)
  empty_squares(board).sample
end

def computer_places_piece!(board)
  square = get_urgent_position(board)
  square = CENTER_SQUARE if center_square_available?(square, board)
  square = pick_random_square(board) if !square
  board[square] = COMPUTER_MARKER
end

def player_places_piece!(board)
  square = ''
  loop do
    puts "Choose a position to place a piece: #{joinor(empty_squares(board))}:"
    square = gets.chomp
    square.delete!(' ')
    break if empty_squares(board).include?(square.to_i) && integer?(square)
    messages('invalid_choice')
  end
  board[square.to_i] = PLAYER_MARKER
end

def adjust_score!(winner, score_hash)
  score_hash[winner] += 1
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won_round?(board)
  !!detect_winner(board)
end

def someone_is_champion?(score_hash)
  score_hash['Player'] == ROUNDS_TO_WIN ||
    score_hash['Computer'] == ROUNDS_TO_WIN
end

def display_champion(score_hash)
  if score_hash['Player'] == ROUNDS_TO_WIN
    messages('player_wins')
  else
    messages('computer_wins')
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  else
    'Player'
  end
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  elsif current_player == 'Computer'
    computer_places_piece!(board)
  end
end

def play_a_round(board, score_hash, current_player)
  loop do
    clear
    messages('welcome')
    display_overall_score(score_hash)
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won_round?(board) || board_full?(board)
  end
end

def play_again?
  messages('play_again')
  loop do
    answer = gets.chomp
    answer.delete!(' ')
    if VALID_YES.include?(answer.downcase)
      return true
    elsif VALID_NO.include?(answer.downcase)
      return false
    else
      messages('try_again')
    end
  end
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == IN_A_ROW_TO_WIN
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == IN_A_ROW_TO_WIN
      return 'Computer'
    end
  end
  nil
end

def computer_chooses
  choice = CHOICE.sample
  if choice == 1
    'Player'
  else
    'Computer'
  end
end

def who_plays_first_convert(answer)
  first_player = nil
  loop do
    first_player = WHOS_TURN[answer.to_i]
    first_player = computer_chooses if first_player == WHOS_TURN[3]
    if !first_player
      first_player = computer_chooses
    end
    if !first_player
      messages('try_again')
      next
    end
    return first_player
  end
end

def who_plays_first?
  answer = ''
  loop do
    answer = gets.chomp.delete(' ')
    unless integer?(answer)
      messages('try_again')
      next
    end
    break
  end
  who_plays_first_convert(answer)
end

def display_overall_score(score_hash)
  puts "The overall score is:
  Player: #{score_hash['Player']}
  Computer: #{score_hash['Computer']}\n\n"
end

loop do
  clear
  messages('play_first')
  plays_first = who_plays_first?
  score_hash = { 'Player' => 0, 'Computer' => 0 }
  loop do
    board = initialize_board
    play_a_round(board, score_hash, plays_first)
    clear
    display_board(board)

    if someone_won_round?(board)
      winner = detect_winner(board)
      adjust_score!(winner, score_hash)
      messages(winner)
    else
      messages('tie')
    end

    continue

    if someone_is_champion?(score_hash)
      clear
      display_champion(score_hash)
      break
    end
  end
  next if play_again?
  break
end

messages('thanks_for_playing')
