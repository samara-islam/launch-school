VALID_CHOICES = %w(rock paper scissors lizard spock)

def clear_screen
	Gem.win_platform? ? system("cls") : system("clear")
end

def prompt(message)
	puts "=> #{message}"
end

def message_box(message)
	message.size.times { |_| print '*' }
	puts "\n#{message}"
	message.size.times { |_| print '*' }
	puts "\n"
end

def win?(first, second)
	(first == 'scissors' && second == 'paper') ||
	(first == 'paper' && second == 'rock') ||
	(first == 'rock' && second == 'lizard') ||
	(first == 'lizard' && second == 'spock') ||
	(first == 'spock' && second == 'scissors') ||
	(first == 'sciccors' && second == 'lizard') ||
	(first == 'lizard' && second == 'paper') ||
	(first == 'paper' && second == 'spock') ||
	(first == 'spock' && second == 'rock') ||
	(first == 'rock' && second == 'scissors')
end

def valid_player?(player)
	VALID_CHOICES.include?(player.downcase)
end

def display_welcome
	clear_screen
	message_box("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
end

def retrieve_computer_choice
	VALID_CHOICES.sample
end

def retrieve_player_choice 
	player = ''
	loop do
		prompt("Choose rock, paper, scissors, lizard, or Spock")
		player = gets.chomp
		break if valid_player?(player)
		prompt("Invalid player! Please choose rock, paper, scissors, lizard, or Spock.")
	end
	player
end

def display_winner(player1, player2)
	puts "Your choice: #{player1}\ncomputer choice: #{player2}"
	if win?(player1, player2)
		winner = "Player 1 wins!"
	elsif win?(player2, player1)
		winner = "Computer wins!"
	else
		winner = "it's a tie!"
	end
	puts winner
end
	

display_welcome
loop do 
	player1 = retrieve_player_choice
	player2 = retrieve_computer_choice
	puts "#{player1} and #{player2}"
 display_winner(player1, player2)
end

# go_again = retrieve_go_again

