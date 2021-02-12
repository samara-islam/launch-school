require 'yaml'

VALID_CHOICES = YAML.load_file('rps_choices.yml')
VALID_PLAYERS = %w(rock paper scissors lizard spock)
WINNER = {
	'rock' => %w(scissors lizard),
	'paper' =>%w(rock spock),
	'scissors' => %w(paper lizard),
	'lizard' => %w(spock paper),
	'spock' => %w(scissors rock)
}

def prompt(string)
  puts "=> #{string}"
end

def display_results(player, computer)
	if WINNER[player].include?(computer)
	prompt "you won"
  elsif WINNER[computer].include?(player)
	prompt "computer won"
  else
	prompt "it's a tie"
  end
end

loop do
	game_round = 0
	score = { player: 0, cpu: 0 }

	loop do
  	choice = ''
  	loop do
    	prompt("Choose one: #{VALID_CHOICES.join(', ')}")
	  	choice = gets.chomp
	
	  	if VALID_CHOICES.include?(choice)
		  	break
	  	else
		  	prompt "That's not valid choice."
	  	end
  	end

  	computer_choice = VALID_CHOICES.sample

  	puts "you chose: #{choice}. Computer chose: #{computer_choice}"

		display_results(choice, computer_choice)

  

		prompt "play again?"
		answer = gets.chomp
		break unless answer.downcase.start_with?('y')
	end
end

prompt 'thanks for playing! bye.'