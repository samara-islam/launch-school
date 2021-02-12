require 'yaml'
require 'io/console'

VALID_CHOICES = YAML.load_file('rps_choices.yml')
WINNING_SETS = YAML.load_file('rps_winning_sets.yml')
MESSAGES = YAML.load_file('rps_messages.yml')

VALID_EXIT = %w(yes ye y no n on)

def clear_screen
  system "clear"
end

def prompt(string)
  puts "=> #{string}"
end

def add_space
  puts "\n"
end

def message(string)
  MESSAGES[string]
end

def valid_player?(input)
  VALID_CHOICES['rock'].include?(input) ||
    VALID_CHOICES['paper'].include?(input) ||
    VALID_CHOICES['scissors'].include?(input) ||
    VALID_CHOICES['lizard'].include?(input) ||
    VALID_CHOICES['spock'].include?(input)
end

def set_player(input)
  if VALID_CHOICES['rock'].include?(input)
    player = 'rock'
  elsif VALID_CHOICES['paper'].include?(input)
    player = 'paper'
  elsif VALID_CHOICES['scissors'].include?(input)
    player = 'scissors'
  elsif VALID_CHOICES['lizard'].include?(input)
    player = 'lizard'
  elsif VALID_CHOICES['spock'].include?(input)
    player = 'spock'
  end
  player
end

def retrieve_player
  prompt message 'choose_player'
  player = ''
  loop do
    player = gets.chomp
    player = player.downcase
    break if valid_player?(player)
    add_space
    prompt message 'invalid_player'
  end
  set_player(player)
end

def set_computer_player
  WINNING_SETS.keys.sample
end

def set_winner(player, computer)
  if WINNING_SETS[player].include?(computer)
    winner = 'player1'
  elsif WINNING_SETS[computer].include?(player)
    winner = 'player2'
  else winner = 'tie'
  end
  winner
end

def display_winner(player1, player2, winner)
  add_space
  print message 'human_select'
  puts player1.capitalize
  print message 'computer_select'
  puts player2.capitalize
  if winner == 'player1'
    puts message 'human_wins_round'
  elsif winner == 'player2'
    puts message 'computer_wins_round'
  elsif winner == 'tie'
    puts message 'tie_round'
  end
end

def update_score(winner, score)
  case winner
  when 'player1'
    score[:human] += 1
  when 'player2'
    score[:computer] += 1
  else
    true
  end
end

def first_to_five?(score_hash)
  score_hash[:human] < 5 && score_hash[:computer] < 5
end

def valid_exit?(response)
  VALID_EXIT.include?(response)
end

def retrieve_go_again
  prompt message 'try_again'
  input = ''
  loop do
    input = gets.chomp
    input = input.downcase
    break if valid_exit?(input)
    prompt message 'invalid_try_again'
  end
  input
end

def go_again?
  response = retrieve_go_again
  response.include?('n')
end

def title_box(string)
  string.size.times { |_| print "-" }
  add_space
  puts string
  string.size.times { |_| print "-" }
end

def display_score(score)
  print message 'wins'
  puts score[:human]
  print message 'losses'
  puts score[:computer]
end

def display_round(round)
  print message 'round'
  puts round.to_s
end

def display_ticker(round, score)
  display_round(round)
  display_score(score)
  add_space
end

def add_round(round)
  round + 1
end

def press_key_to_continue
  add_space
  prompt message 'press_to_continue'
  STDIN.getch
end

def display_exit_message
  clear_screen
  puts message 'goodbye'
end

def display_welcome_message
  clear_screen
  title_box message 'welcome'
  add_space
  add_space
  puts message 'rules'
  add_space
  press_key_to_continue
end

def print_endgame_message(score_hash)
  if score_hash[:human].to_i > 4
    puts message 'human_wins'
  else
    puts message 'computer_wins'
  end
end

def display_final_score(score_hash)
  title_box message 'final_score'
  add_space
  print message 'human_score'
  puts score_hash[:human]
  print message 'computer_score'
  puts score_hash[:computer]
  add_space
  print_endgame_message(score_hash)
  add_space
end

def round_loop(round, score)
  while first_to_five?(score)
    display_ticker(round, score)
    human_player = retrieve_player
    computer_player = set_computer_player
    round_winner = set_winner(human_player, computer_player)
    update_score(round_winner, score)
    display_winner(human_player, computer_player, round_winner)
    round = add_round(round)
    press_key_to_continue
    clear_screen
  end
end

def main_loop
  loop do
    clear_screen
    round = 1
    score = { human: 0, computer: 0 }
    round_loop(round, score)
    display_final_score(score)
    break if go_again?
  end
end

def play_game
  display_welcome_message
  main_loop
  display_exit_message
end

play_game
