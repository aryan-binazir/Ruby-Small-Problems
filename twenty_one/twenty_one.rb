require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
SUITS = %w(Hearts Diamonds Spades Clubs)
RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
PLAYER_OR_DEALER = { 'player' => :player_cards, 'dealer' => :dealer_cards }
VALID_YES = ['y', 'yes']
VALID_NO = ['n', 'no']
VALID_HIT = ['h', 'hit']
VALID_STAY = ['s', 'stay']
MAX_SCORE = 21
DEALER_MAX = 17
ROUNDS_TO_WIN = 5

def messages(message)
  puts(MESSAGES[message])
end

def clear
  system('clear')
end

def continue
  messages("enter")
  gets.chomp
end

def invalid_input
  messages('invalid_try_again')
  continue
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    RANKS.each do |rank|
      deck << { suit: suit, rank: rank }
    end
  end
  deck.shuffle!
end

def initial_deal_cards(hands, deck)
  PLAYER_OR_DEALER.values.each do |person|
    2.times { hands[person] << deck.pop }
  end
end

def deal_card(hands, deck, person)
  hands[PLAYER_OR_DEALER[person]] << deck.pop
end

def update_round_scores(hands, round_scores, person)
  if person == 'Player'
    round_scores[:player_round_score] = hand_total(hands[:player_cards])
  elsif person == 'Dealer'
    round_scores[:dealer_round_score] = hand_total(hands[:dealer_cards])
  end
end

def player_turn(hands, deck, round_scores)
  update_round_scores(hands, round_scores, 'Player')
  loop do
    answer = player_input(hands, round_scores)
    if VALID_STAY.include?(answer.downcase)
      break
    elsif VALID_HIT.include?(answer.downcase)
      deal_card(hands, deck, 'player')
    else
      invalid_input
    end
    update_round_scores(hands, round_scores, 'Player')
    break if bust?(round_scores[:player_round_score])
  end
  player_not_busted(hands, round_scores)
  continue
  clear
end

def player_input(hands, round_scores)
  clear
  display_hands(hands, round_scores)
  messages('hit_stay')
  gets.chomp
end

def player_not_busted(hands, round_scores)
  if bust?(round_scores[:player_round_score])
    clear
    display_hands(hands, round_scores)
  else
    display_player_stay(round_scores)
  end
end

def display_player_stay(round_scores)
  messages('lines')
  puts "You decided to stay at #{round_scores[:player_round_score]}"
  messages('lines')
end

def dealer_turn(hands, deck, round_scores)
  display_dealer_cards_score(hands, round_scores)
  continue
  clear
  loop do
    break if round_scores[:dealer_round_score] >= DEALER_MAX &&
             dealer_ahead_of_player?(round_scores)
    display_dealer_hit
    continue
    clear
    hands[:dealer_cards] << deck.pop
    update_round_scores(hands, round_scores, 'Dealer')
    display_dealer_cards_score(hands, round_scores)
  end
  dealer_not_busted(hands, round_scores)
end

def display_dealer_hit
  messages('lines')
  messages('dealer_hit')
  messages('lines')
end

def dealer_ahead_of_player?(round_scores)
  # if equal (total over 17) dealer won't take risk and would rather take a tie
  round_scores[:dealer_round_score] >= round_scores[:player_round_score]
end

def dealer_not_busted(hands, round_scores)
  if !bust?(round_scores[:dealer_round_score])
    display_dealer_stay(round_scores)
  end
end

def display_dealer_stay(round_scores)
  messages('lines')
  puts "Dealer stays at #{round_scores[:dealer_round_score]}"
  messages('lines')
end

def display_dealer_cards_score(hands, round_scores)
  messages('lines')
  puts "Dealer's hand is: "
  hands[:dealer_cards].each do |card|
    puts "#{card[:rank]} of #{card[:suit]}"
  end
  messages('lines')
  puts "Dealer total is now: #{round_scores[:dealer_round_score]}"
  messages('lines')
end

def bust?(total)
  total > MAX_SCORE
end

def round_result(round_scores)
  if bust?(round_scores[:player_round_score])
    :player_busted
  elsif bust?(round_scores[:dealer_round_score])
    :dealer_busted
  elsif round_scores[:player_round_score] > round_scores[:dealer_round_score]
    :player_wins
  elsif round_scores[:dealer_round_score] > round_scores[:player_round_score]
    :dealer_wins
  else
    :tie
  end
end

def display_hands(hands, round_scores)
  messages('lines')
  puts "Your hand is: "
  hands[:player_cards].each do |card|
    puts "#{card[:rank]} of #{card[:suit]}"
  end
  messages('lines')
  puts "One of the dealer's cards is: \n#{hands[:dealer_cards][0][:rank]} of #{hands[:dealer_cards][0][:suit]}."
  messages('lines')
  puts "Your hand total is #{round_scores[:player_round_score]}."
  messages('lines')
  puts "\n"
end

def display_winner(result, round_scores)
  display_current_scores(result, round_scores)
  messages(result.to_s)
  messages('lines')
end

def display_current_scores(result, round_scores)
  messages('lines')
  puts "Player total score is #{round_scores[:player_round_score]}"
  if result != :player_busted
    puts "Dealer total score is #{round_scores[:dealer_round_score]}"
  end
  messages('lines')
end

def hand_total(hand)
  values = hand.map { |card| card[:rank] }
  sum = 0
  values.each do |value|
    sum += calculate_value_for_sum(value)
  end
  adjust_for_aces(sum, values)
end

def adjust_for_aces(sum, values)
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > MAX_SCORE
  end
  sum
end

def calculate_value_for_sum(value)
  if value == "Ace"
    11
  elsif value.to_i == 0
    10
  else
    value.to_i
  end
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    if VALID_YES.include?(answer)
      return true
    elsif VALID_NO.include?(answer)
      return false
    else
      invalid_input
    end
  end
end

def play_a_round(hands, deck, round_scores)
  player_turn(hands, deck, round_scores)
  if !bust?(round_scores[:player_round_score])
    round_scores[:dealer_round_score] = hand_total(hands[:dealer_cards])
    dealer_turn(hands, deck, round_scores)
    continue
    clear
  end
end

def display_total_scores(total_scores)
  puts "ROUNDS WON => PLAYER: #{total_scores[:player_total_score]}
              DEALER: #{total_scores[:dealer_total_score]}"
end

def log_win(result, total_scores)
  case result
  when :player_busted
    total_scores[:dealer_total_score] += 1
  when :dealer_busted
    total_scores[:player_total_score] += 1
  when :player_wins
    total_scores[:player_total_score] += 1
  when :dealer_wins
    total_scores[:dealer_total_score] += 1
  end
end

def champion?(total_scores)
  total_scores[:player_total_score] == ROUNDS_TO_WIN ||
    total_scores[:dealer_total_score] == ROUNDS_TO_WIN
end

def display_champion(total_scores)

  if total_scores[:player_total_score] == ROUNDS_TO_WIN
    messages('pound')
    messages('pound')
    messages('player_champion')
    messages('pound')
    messages('pound')
  elsif total_scores[:dealer_total_score] == ROUNDS_TO_WIN
    messages('pound')
    messages('pound')
    messages('dealer_champion')
    messages('pound')
    messages('pound')
  end
end

def display_goodbye
  puts "\n\n"
  messages('pound')
  messages('thanks_playing')
  messages('pound')
end

# Main Game
loop do
  total_scores = { player_total_score: 0, dealer_total_score: 0 }
  clear
  loop do
    
    round_scores = { player_round_score: 0, dealer_round_score: 0 }
    
    messages('welcome')
    messages('rules')
    display_total_scores(total_scores)
    continue
    clear

    hands = { player_cards: [], dealer_cards: [] }
    deck = initialize_deck
    initial_deal_cards(hands, deck)

    play_a_round(hands, deck, round_scores)

    result = round_result(round_scores)
    display_winner(result, round_scores)
    log_win(result, total_scores)
    break if champion?(total_scores)
  end
  display_champion(total_scores)
  messages('play_again')
  break unless play_again?
end

display_goodbye
