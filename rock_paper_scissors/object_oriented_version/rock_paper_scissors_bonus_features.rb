class Move
  def >(other_move)
    @wins_vs.include?(other_move.type_of_move)
  end

  def type_of_move
    self.class.to_s.downcase
  end

  def to_s
    self.class.to_s
  end
end

class Rock < Move
  def initialize
    @wins_vs = ['scissors', 'lizard'].freeze
  end
end

class Paper < Move
  def initialize
    @wins_vs = ['rock', 'spock'].freeze
  end
end

class Scissors < Move
  def initialize
    @wins_vs = ['paper', 'lizard'].freeze
  end
end

class Lizard < Move
  def initialize
    @wins_vs = ['paper', 'spock'].freeze
  end
end

class Spock < Move
  def initialize
    @wins_vs = ['scissors', 'rock'].freeze
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  CONVERT_HSH = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                  'l' => 'lizard', 'sp' => 'spock' }.freeze

  def choose
    choice = nil
    loop do
      puts "Please choose (R)ock, (P)aper, (Sc)issors, (L)izard or (Sp)ock:"
      choice = gets.chomp.downcase
      break if (CONVERT_HSH.keys + CONVERT_HSH.values).include?(choice)
      puts "Sorry, invalid choice."
    end
    choice = convert_choice(choice)
    choice_const = Object.const_get(choice.capitalize)
    self.move = choice_const.new
  end

  def convert_choice(choice)
    return CONVERT_HSH[choice] if CONVERT_HSH.keys.include?(choice)
    choice
  end

  private

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end
end

class Computer < Player
  attr_reader :computer, :comp_values

  def choose
    choice = computer.comp_values.sample
    choice_const = Object.const_get(choice.capitalize)
    self.move = choice_const.new
  end

  private

  def choose_computer
    computers = [BigHero6.new, R2d2.new, Chappie.new, Sonny.new, Number5.new]
    @computer = computers.sample
  end

  def set_name
    choose_computer
    @name = computer.name
  end
end

class BigHero6 < Computer
  def initialize
    @name = 'Big Hero 6'
    @comp_values = ['rock']
  end
end

class R2d2 < Computer
  def initialize
    @name = 'R2D2'
    @comp_values = ['spock']
  end
end

class Chappie < Computer
  def initialize
    @name = 'Chappie'
    @comp_values = ['rock', 'rock', 'rock', 'paper', 'paper', 'paper',
                    'scissors', 'lizard']
  end
end

class Sonny < Computer
  def initialize
    @name = 'Sonny'
    @comp_values = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end
end

class Number5 < Computer
  def initialize
    @name = 'Number 5'
    @comp_values = ['rock', 'paper', 'scissors', 'scissors', 'scissors',
                    'scissors', 'scissors', 'scissors', 'scissors', 'scissors',
                    'scissors', 'lizard', 'spock']
  end
end

class ScoreBoard
  attr_accessor :scorekeeper
  attr_reader :human, :computer

  WINS_FOR_CHAMPION = 10

  def initialize(human, computer)
    @human = human
    @computer = computer
    @scorekeeper = { human.name => 0, computer.name => 0 }
  end

  def display_score
    puts self
  end

  def increment_winner_score(winner)
    if winner == human
      increment_player_score(human)
    elsif winner == computer
      increment_player_score(computer)
    end
  end

  def champion?
    scorekeeper[human.name] == WINS_FOR_CHAMPION ||
      scorekeeper[computer.name] == WINS_FOR_CHAMPION
  end

  def display_champion
    if scorekeeper[human.name] == WINS_FOR_CHAMPION
      puts "#{human.name} is the champion!!!"
    elsif scorekeeper[computer.name] == WINS_FOR_CHAMPION
      puts "#{computer.name} is the champion!!!"
    end
  end

  def increment_player_score(winner)
    scorekeeper[winner.name] += 1
  end

  def to_s
    "SCOREBOARD\n#{human.name}: #{scorekeeper[human.name]}
#{computer.name}: #{scorekeeper[computer.name]}"
  end
end

class RPSGame
  attr_accessor :human, :computer, :score, :history, :round

  VALIDYESORNO = ['y', 'n', 'yes', 'no']
  @@round = 0

  def initialize
    clear_display
    @human = Human.new
    @computer = Computer.new
    @history = { round: [], human: [], computer: [] }
  end

  def play
    display_welcome_message
    play_round
    display_goodbye_message
  end

  def play_round
    loop do
      @score = ScoreBoard.new(human, computer)
      @@round += 1
      play_individual_game
      score.display_champion
      display_history if want_history?
      break unless play_again?
      clear_display
    end
  end

  def play_individual_game
    loop do
      choose_moves
      add_moves_to_history
      display_moves
      winner = find_winner
      display_winner(winner)
      score.increment_winner_score(winner) unless winner.nil?
      display_score
      break if score.champion?
    end
  end

  private

  def display_score
    score.display_score
    add_space
  end

  def display_welcome_message
    clear_display
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock, #{human.name}!\n\n"
    puts "    Scissors decapitate Scissors cuts paper, paper covers rock,
    rock crushes lizard, lizard poisons Spock, Spock smashes scissors,
    scissors decapitates lizard, lizard eats paper, paper disproves Spock,
    Spock vaporizes rock, and as it always has, rock crushes scissors.\n\n"
    puts "First player to win 10 rounds in the champion!\n\n"
  end

  def display_goodbye_message
    clear_display
    puts "Thanks for playing Rock, Paper, Scissors. Good Bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner(winner)
    add_space
    if winner == human
      puts "#{human.name} won this round!"
    elsif winner == computer
      puts "#{computer.name} won this round!"
    else
      puts "This round was a tie!"
    end
    add_space
    continue_and_clear
  end

  def choose_moves
    human.choose
    computer.choose
  end

  def find_winner
    if human.move > computer.move
      human
    elsif computer.move > human.move
      computer
    end
  end

  def add_moves_to_history
    history[:round] << "Round #{@@round}"
    history[:human] << human.move.type_of_move.capitalize
    history[:computer] << computer.move.type_of_move.capitalize
    clear_display
  end

  def play_again?
    check_yes_or_no("Would you like to play again? (y/n)")
  end

  def want_history?
    check_yes_or_no("Would you like to see the game's history so far? (y/n)")
  end

  def display_history
    history[:human].each_with_index do |move, idx|
      puts "#{history[:round][idx]}:"
      puts "#{human.name} chose #{move}"
      puts "#{computer.name} chose #{history[:computer][idx]}"
      puts "\n"
    end
  end

  def clear_display
    system("clear")
  end

  def add_space
    puts "\n"
  end

  def continue_and_clear
    print "Press enter key to continue..."
    gets.chomp
    clear_display
  end

  def check_yes_or_no(question)
    answer = nil
    loop do
      puts question
      answer = gets.chomp
      break if VALIDYESORNO.include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    answer.downcase.start_with?('y')
  end
end

RPSGame.new.play
