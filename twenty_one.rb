module Displayable
  def show_result
    if player.busted?
      display_player_busted_message
    elsif dealer.busted?
      puts "Dealer busted! You win!"
    else
      winner_by_score
    end
  end

  def winner_by_score
    display_game_score
    if player.total > dealer.total
      puts "You Win!"
    elsif dealer.total > player.total
      puts "Dealer Wins!"
    else
      puts "It's a tie!"
    end
  end

  def dealer_hit
    puts "The Dealer has decided to hit!"
    puts ""
    deck.deal(dealer)
    puts "The Dealer was dealt the card | #{dealer.hand.last} | "
  end

  def dealer_stay
    puts "The Dealer has decided to stay at #{dealer.total}"
  end

  def display_player_busted_message
    puts "You were dealt #{player.hand.last}"
    puts ""
    puts "Your score is #{player.total}"
    puts ""
    puts "You busted! Dealer wins!"
  end

  def display_welcome_message
    clear
    puts "Welcome to Twenty One!"
    puts ""
    puts "    Whoever gets closer to 21 wins! But be careful
    if you go over 21 you BUST!"
    puts ""
    continue_and_clear
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty One! Goodbye!"
  end

  def display_game_score
    puts ""
    puts "Your score: #{player.total}, Dealer score: #{dealer.total}"
    puts ""
  end

  def continue_and_clear
    puts "Press enter to continue..."
    gets.chomp
    clear
  end

  def show_initial_cards
    clear
    show_player_hand
    puts ""
    puts ""
  end

  def show_player_hand
    puts "Your hand is | #{player.show_hand} |"
    puts ""
    puts "Dealer's first card is | #{dealer.hand[0]} |"
    puts ""
    puts "Your total score is #{player.total}"
  end

  def show_dealer_hand
    puts "Dealer hand is | #{dealer.show_hand} |"
    puts ""
    puts "Your total score is #{player.total}"
    puts ""
    puts "The Dealer's total score is #{dealer.total}"
    continue_and_clear
  end
end

module Hand
  CARD_SCORE_HSH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                     '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10,
                     'Queen' => 10, 'King' => 10, 'Ace' => 11 }

  def busted?
    total > 21
  end

  def total
    total = 0
    hand.each do |card|
      total += CARD_SCORE_HSH[card.value[:rank]]
    end
    adjust_for_aces(total)
  end

  def adjust_for_aces(total)
    no_aces = hand.select { |card| card.value[:rank] == Card::ACE }.count
    no_aces.times do
      total -= 10 if total > Game::MAX_SCORE
    end
    total
  end

  def show_hand
    hand = []
    self.hand.each do |card|
      hand << "#{card.value[:rank]} of #{card.value[:suit]}"
    end
    hand.join(" | ")
  end

  def reset
    self.hand = []
  end
end

class Participant
  include Hand

  def initialize
    @hand = []
  end
end

class Player < Participant
  attr_accessor :hand
end

class Dealer < Participant
  DEALER_LIMIT = 17
  attr_accessor :hand
end

class Deck
  attr_accessor :cards, :deck

  def initialize
    @cards = []
    @deck = new_deck
    shuffle_cards
  end

  def deal(deal_to)
    deal_to.hand << cards.pop
  end

  def new_deck
    card_arr = Card::RANKS.product(Card::SUITS)
    card_arr.each do |pair|
      cards << Card.new(pair[0], pair[1])
    end
  end

  def shuffle_cards
    cards.shuffle!
  end

  def reset
    @cards = []
    new_deck
    shuffle_cards
  end
end

class Card
  SUITS = ["Diamonds", "Hearts", "Clubs", "Spades"].freeze
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
  ACE = "Ace"
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @value = { rank: rank, suit: suit }
  end

  def to_s
    "#{value[:rank]} of #{value[:suit]}"
  end
end

class Game
  include Displayable

  MAX_SCORE = 21
  VALID_CHOICES = ['h', 'hit', 's', 'stay']
  VALID_PLAY_RESPONSES = %w(y n yes no)

  attr_reader :dealer, :player, :deck

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new
  end

  def start
    display_welcome_message
    loop do
      deal_cards_initial_hand
      player_turn
      dealer_turn unless player.busted?
      show_result
      break unless play_again?
      game_reset
    end
    display_goodbye_message
  end

  def play_again?
    answer = nil
    loop do
      puts ""
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if VALID_PLAY_RESPONSES.include? answer
      puts "Sorry, must be y or n"
    end
    answer.start_with?('y')
  end

  def deal_cards_initial_hand
    clear
    2.times do
      deck.deal(player)
      deck.deal(dealer)
    end
  end

  def player_turn
    loop do
      break if player.busted?
      show_player_hand
      choice = player_choices
      choice.start_with?('h') ? player_hit : player_stay
      break unless choice.start_with?('h')
    end
  end

  def dealer_turn
    loop do
      show_dealer_hand
      break if dealer.busted?
      if dealer.total >= Dealer::DEALER_LIMIT
        dealer_stay
        break
      end
      dealer_hit
      continue_and_clear
    end
  end

  def verify_player_input
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if Game::VALID_CHOICES.include?(choice.delete(' '))
      clear
      puts "That is not a valid input..."
      puts ""
      puts "Please enter either h to hit or s to stay..."
    end
    choice
  end

  def player_choices
    puts ""
    puts "You can either hit or stay."
    puts ""
    puts "Choose h to hit, s to stay..."
    verify_player_input
  end

  def player_stay
    clear
    puts "You have decided to stay at #{player.total}"
    continue_and_clear
  end

  def player_hit
    clear
    puts "You have decided to hit!"
    deck.deal(player)
  end

  def game_reset
    player.reset
    dealer.reset
    deck.reset
  end

  def clear
    system 'clear'
  end
end

Game.new.start
