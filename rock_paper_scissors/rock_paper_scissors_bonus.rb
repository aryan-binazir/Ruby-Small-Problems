VALID_CHOICES = {  "r" => 'rock',
                   "p" => 'paper',
                   "sc" => 'scissors',
                   "l" => 'lizard',
                   "sp" => 'spock' }
WINNING_COMBOS = {  rock: ['scissors', 'lizard'],
                    paper: ['rock', 'spock'],
                    scissors: ['paper', 'lizard'],
                    lizard: ['paper', 'spock'],
                    spock: ['scissors', 'rock'] }
VALID_PLAY_AGAIN = %w(y yes n no)
WINNING_SCORE = 3

def clear
  system("clear")
end

def prompt(message)
  puts("=> #{message}")
end

def display_game_rules
  prompt("\n\n** WELCOME TO ROCK PAPER SCISSORS LIZARD SPOCK!**

    RULES:
    Scissors cuts Paper
    Paper covers Rock
    Rock crushes Lizard
    Lizard poisons Spock
    Spock smashes Scissors
    Scissors decapitates Lizard
    Lizard eats Paper
    Paper disproves Spock
    Spock vaporizes Rock
    (and as it always has) Rock crushes Scissors


    **FIRST TO 3 POINTS WINS!**\n\n")
end

def display_current_score(score)
  puts("The current score is ")
  puts("  Player: #{score[:player]}")
  puts("Computer: #{score[:computer]}\n\n")
end

def increment_score(score, player_or_computer)
  score[player_or_computer.to_sym] += 1
end

def calculate_round_results(player, computer)
  if WINNING_COMBOS[(player.to_sym)].include?(computer)
    'player'
  elsif WINNING_COMBOS[computer.to_sym].include?(player)
    'computer'
  else
    'tie'
  end
end

def display_round_results(player, computer, who_won)
  puts("You chose: #{player}; Computer chose: #{computer}")
  if who_won == 'player'
    prompt("Player won round!")
  elsif who_won == 'computer'
    prompt("Computer won round!")
  else
    prompt("It's a tie this round!")
  end
end

def choose_one
  prompt("Choose one: Rock(r), Paper(p), Scissors(sc), Lizard(l), Spock(sp)")
  choice = ''

  loop do
    choice = gets.chomp.downcase
    if VALID_CHOICES.flatten.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  if VALID_CHOICES.values.include?(choice)
    choice
  elsif VALID_CHOICES.keys.include?(choice)
    VALID_CHOICES[choice]
  end
end

def computer_chooses
  VALID_CHOICES.values.sample
end

def play_again?
  answer = ''
  loop do
    prompt("Do you want to play again? Y/N.")
    answer = gets.chomp
    break if VALID_PLAY_AGAIN.include?(answer.downcase)
    clear
    prompt("That's not a valid choice.")
  end
  answer.downcase == 'y' ||
    answer.downcase == 'yes'
end

def ultimate_champion(score)
  if score[:player] == WINNING_SCORE
    prompt("Player is the champion!\n\n")
  elsif score[:computer] == WINNING_SCORE
    prompt("Computer is the champion!\n\n")
  end
end

def there_a_winner?(the_score)
  the_score[:player] == WINNING_SCORE || the_score[:computer] == WINNING_SCORE
end

def game(score)
  loop do
    display_current_score(score)

    choice = choose_one
    computer_choice = computer_chooses

    winner = calculate_round_results(choice, computer_choice)

    clear
    display_round_results(choice, computer_choice, winner)
    increment_score(score, winner) if winner != 'tie'
    break if there_a_winner?(score)
  end
end

loop do
  score = { player: 0, computer: 0 }

  clear
  display_game_rules

  game(score)

  ultimate_champion(score)

  break unless play_again?
  clear
end

prompt("Thank you for playing. Good bye!")
