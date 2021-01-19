require 'yaml'

MESSAGES = YAML.load_file('calculator_v2_messages.yml')

VALID_OPERATORS = %w(1 2 3 4)
VALID_EXIT = %w(yes ye y no n)

# display welcome

def clear_screen
	Gem.win_platform? ? system("cls"): system("clear")
end

def prompt(string)
	puts "=> #{string}"
end

def message(string)
	MESSAGES[string]
end

def message_box(string)
	string.size.times { |_| print "-" }
	puts "\n"
	puts string
	string.size.times { |_| print "-" }
	puts "\n"
end

def valid_name?(string)
	!(string.empty? || string[0] == ' ')
end

def retrieve_name
	name = ''
	prompt message 'enter_name'
	loop do
		name = gets.chomp
		break if valid_name?(name)
		prompt message 'invalid_name'
	end
	name
end

def display_welcome
	clear_screen
	message_box message 'welcome'
end

def valid_number?(input)
	input.to_i.to_s == input || input.to_f.to_s == input
end

def retrieve_number
	clear_screen
	prompt message 'enter_number'
	number = ''
	loop do
		number = gets.chomp
		break if valid_number?(number)
		prompt message 'invalid_number'
	end
	number
end

def divide_by_zero?(operator, second_number)
	operator == '4' && second_number == '0'
end

def valid_operator?(operator)
	!(VALID_OPERATORS.include?(operator))
end	

def retrieve_operator(second_number)
	clear_screen
	prompt message 'choose_operator'
	operator = ''
	loop do
		operator = gets.chomp
		if valid_operator?(operator)
			prompt message 'invalid_operator'
		elsif divide_by_zero?(operator, second_number)
			prompt message 'divide_by_zero'
		else
			break
		end
	end
	operator
end

def calculate_results(first_number, second_number, operator)
	case operator
	when '1'
		first_number.to_f + second_number.to_f
	when '2'
		first_number.to_f - second_number.to_f
	when '3'
		first_number.to_f * second_number.to_f
	when '4'
		first_number.to_f / second_number.to_f
	end
end

def display_results(first_number, second_number, operator)
	results = calculate_results(first_number, second_number, operator)
	puts "first number: #{first_number} second number: #{second_number} result: #{results}"
end

def valid_go_again?(input)
	VALID_EXIT.include?(input.downcase)
end

def retrieve_go_again
	prompt message 'go_again'
	input = ''
	loop do
		input = gets.chomp
		break if valid_go_again?(input)
		prompt message 'invalid_go_again'
	end
	input
end


	# display_welcome
	display_welcome

	# retreive user name
	name = retrieve_name

loop do
	# retrieve first number from user
	first_number = retrieve_number

	# retrieve second number from user
	second_number = retrieve_number

	# retrieve operator from user
	operator = retrieve_operator(second_number)

	# display output
	display_results(first_number, second_number, operator)

	go_again = retrieve_go_again

	break if go_again.downcase.include?('n')
end

puts "bye"

