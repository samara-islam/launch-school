require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
STARTUP = YAML.load_file('startup_messages.yml')

def clear_screen
  Gem.win_platform? ? system('cls') : system('clear')
end

def title(message)
  message.size.times { print '*' }
  puts "\n#{message}"
  message.size.times { print '*' }
  puts "\n"
end

def prompt(message)
  puts "=> #{message}"
end

def startup_message(message)
  STARTUP[message]
end

def message(message, language)
  case language
  when '1'
    MESSAGES['en'][message]
  when '2'
    MESSAGES['es'][message]
  end
end

def currency_prompt
  print '$'
end

# Display methods --->

def display_welcome_screen
  clear_screen
  title(startup_message('title'))
  puts "\n"
  puts(startup_message('greeting'))
  puts "\n"
end

def display_header(language)
  clear_screen
  title(message('title', language))
end

def display_results(monthly_payment, language)
  clear_screen
  title(message('results_screen', language))
  puts "\n"
  print(message('monthly_payment', language))
  print currency_prompt
  puts monthly_payment.to_s
  puts "\n"
end

def display_goodbye(language)
  prompt(message('goodbye', language))
end

# Verification methods --->

def valid_language?(input)
  %w(1 2).include?(input)
end

def valid_integer?(integer)
  integer.to_i.to_s == integer
end

def valid_float?(float)
  float.to_f.to_s == float
end

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def valid_input?(input)
  ['yes', 'ye', 'y', 'yees', 'ys', 'eys', 'yess',
   'n', 'no', 'noo', 'nn', 'on'].include?(input)
end

def calculate_again?(language)
  prompt(message('calculate_again', language))
  user_input = ''
  loop do
    user_input = gets.chomp
    break if valid_input?(user_input)
    
    prompt(message('invalid_calculate_again', language))
  end
  user_input.downcase.include?('y')
end

# Retrieval methods --->

def retrieve_apr(language)
  display_header(language)
  prompt(message('retrieve_apr', language))
  apr = nil
  loop do
    apr = gets.chomp
    break if valid_float?(apr)
    
    prompt(message('invalid_apr_entry', language))
  end
  apr
end

def retrieve_loan_duration(language)
  display_header(language)
  prompt(message('retrieve_loan_duration', language))
  loan_duration = nil
  loop do
    loan_duration = gets.chomp
    break if valid_number?(loan_duration)
    
    prompt(message("invalid_duration_entry", language))
  end
  loan_duration
end

def retrieve_loan_amount(language)
  display_header(language)
  prompt(message('retrieve_loan', language))
  loan_amount = nil
  loop do
    currency_prompt
    loan_amount = gets.chomp
    break if valid_integer?(loan_amount)
    
    prompt(message('invalid_loan_entry', language))
  end
  loan_amount
end

def retrieve_language_select
  prompt(startup_message('language_prompt'))
  language = ''
  loop do
    language = gets.chomp
    break if valid_language?(language)
    
    prompt(startup_message('invalid_language_entry'))
  end
  language
end

# Calculation methods --->

def calculate_loan_duration_months(duration_years)
  duration_years.to_f * 12
end

def calculate_monthly_interest_rate(apr)
  (apr.to_f / 12) / 100
end

def calculate_payment(amount, duration, interest)
  (amount.to_f * (interest / (1 - (1 + interest)**(-duration)))).round(2)
end

# welcome prompt / language select
display_welcome_screen
language = retrieve_language_select

loop do
  # retrieve loan amount, apr, and duration
  loan_amount = retrieve_loan_amount(language)
  apr = retrieve_apr(language)
  loan_duration_years = retrieve_loan_duration(language)

  # calculate duration in months, monthly interest, monthly payment
  loan_duration_months = calculate_loan_duration_months(loan_duration_years)
  monthly_interest_rate =
    calculate_monthly_interest_rate(apr)
  monthly_payment =
    calculate_payment(loan_amount, loan_duration_months, monthly_interest_rate)

  # display results / ask to calculate again
  display_results(monthly_payment, language)
  break unless calculate_again?(language)
  
end

display_goodbye(language)
