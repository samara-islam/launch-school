require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def clear_screen
  Gem.win_platform? ? system('cls') : system('clear')
end

# supported languages: English ('en') and Spanish ('es')
def message(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(string)
  puts "=> #{string}"
end

def operation_to_message(operator)
  operation_message = {
    "1" => message('adding'),
    "2" => message('subtracting'),
    "3" => message('multiplying'),
    "4" => message('dividing')
  }
  operation_message[operator]
end

def calculate_results(operator, first_number, second_number)
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

# Display methods

def display_title(title)
  title.size.times { print '-' }
  puts "\n#{title}"
  title.size.times { print '-' }
  puts "\n"
end

def display_welcome
  clear_screen
  display_title(message('welcome'))
end

def display_select_operands(user_name)
  clear_screen
  display_title(message('select_operands'))
  prompt(message('user') + " #{user_name}\n")
end

def display_select_first_number
  prompt(message('first_number'))
end

def display_select_second_number
  prompt(message('second_number'))
end

def display_retrieve_operator
  clear_screen
  display_title(message('select_operator'))
end

def display_results(results, operator)
  clear_screen
  display_title(message('results'))
  prompt(operation_to_message(operator))
  puts "\n"
  prompt("#{message('calculation_result')} #{results}")
  puts "\n"
end

def display_invalid_number
  prompt(message('valid_number'))
end

def display_invalid_operator
  prompt(message('valid_operator'))
end

def display_operator_prompt
  prompt(message('operator_prompt'))
end

def display_divide_zero
  prompt(message('divide_zero'))
end

def display_calculate_again
  prompt(message('calculate_again'))
end

def display_goodbye
  clear_screen
  display_title(message('goodbye'))
end

# Validation methods

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def valid_operator?(operator)
  if ['1', '2', '3', '4'].include?(operator)
    false
  else
    true
  end
end

def divide_by_zero?(operator, number)
  if operator == '4' && number == '0'
    true
  else
    false
  end
end

def valid_exit?(input)
  ['y', 'ye', 'yes', 'yess', 'yees'].include?(input) ||
    ['n', 'no', 'on', 'nn'].include?(input)
end

def calculate_again?(input)
  input.downcase.include?('y')
end

# Input retrieval methods

def retrieve_name
  prompt(message('enter_name'))
  user_name = ''
  loop do
    user_name = gets.chomp
    break unless user_name.empty? || user_name[0] == ' '
    prompt(message('valid_name'))
  end
  user_name
end

def retrieve_number
  number = nil
  loop do
    number = gets.chomp
    break if valid_number?(number)
    display_invalid_number
  end
  number
end

def retrieve_operator(number)
  operator = ''
  loop do
    operator = gets.chomp
    if valid_operator?(operator)
      display_invalid_operator
    elsif divide_by_zero?(operator, number)
      display_divide_zero
    else
      break
    end
  end
  operator
end

def retrieve_calculate_again
  display_calculate_again
  user_input = ''
  loop do
    user_input = gets.chomp
    break if valid_exit?(user_input)
    prompt(message('calculate_again_invalid'))
  end
  user_input.downcase
end

# welcome user prompt
display_welcome
user_name = retrieve_name

# main loop
loop do
  # select operands prompt
  display_select_operands(user_name)

  # retrieve first number
  display_select_first_number
  first_number = retrieve_number

  # retrieve second number
  display_select_second_number
  second_number = retrieve_number

  # retrieve operator prompt
  display_retrieve_operator
  display_operator_prompt
  operator = retrieve_operator(second_number)

  # display results
  results = calculate_results(operator, first_number, second_number)
  display_results(results, operator)

  # calculate again prompt
  calculate_again_response = retrieve_calculate_again
  break unless calculate_again?(calculate_again_response)
end

# goodbye message
display_goodbye
