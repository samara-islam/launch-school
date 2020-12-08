require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def message_board(message)
  puts "\n"
  message.size.times { print '-' }
  puts "\n#{message}"
  message.size.times { print '-' }
  puts "\n"
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(choice)
  choice.to_i.to_s == choice || choice.to_f.to_s == choice
end

def check_operator?(choice)
  %w(1 2 3 4).include?(choice)
end

def operation_to_message(choice)
  operation = {
    "1" => messages('adding'),
    "2" => messages('subtracting'),
    "3" => messages('multiplying'),
    "4" => messages('dividing')
  }
  operation[choice]
end

# Welcome prompt
Gem.win_platform? ? (system "cls") : (system "clear")
message_board(messages('welcome'))
prompt(messages('enter_name'))

# name entry loop
user_name = ''
loop do
  user_name = gets.chomp
  break unless user_name.empty?
  prompt(messages('valid_name'))
end

# main loop
loop do
  message_board(messages('select_operands'))
  # user select first number
  number_one = nil
  loop do
    prompt(messages('first_number'))
    number_one = gets.chomp
    break if valid_number?(number_one)
    prompt(messages('valid_number'))
  end

  # user select second number
  number_two = nil
  loop do
    prompt(messages('second_number'))
    number_two = gets.chomp
    break if valid_number?(number_two)
    prompt(messages('valid_number'))
  end

  # user select operator
  operator_prompt = messages('operator_prompt')
  message_board(messages('select_operator'))

  operator = ''
  loop do
    prompt(operator_prompt)
    operator = gets.chomp
    break if check_operator?(operator)
    prompt(messages('valid_operator'))
  end

  puts "\n"
  prompt(operation_to_message(operator))

  result = case operator
           when '1'
             number_one.to_f() + number_two.to_f()
           when '2'
             number_one.to_f() - number_two.to_f()
           when '3'
             number_one.to_f() * number_two.to_f()
           when '4'
             number_one.to_f() / number_two.to_f()
           end

  # display results
  message_board(messages('results'))
  puts "#{messages('calculation_result')} #{result}"

  # ask user to perform another calculation
  puts "\n"
  prompt(messages('calculate_again'))
  go_again = gets.chomp
  break unless go_again.downcase.start_with?('y')
end

# goodbye message
message_board(messages('goodbye'))
