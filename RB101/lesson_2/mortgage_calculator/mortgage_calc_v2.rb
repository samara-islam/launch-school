require 'yaml'

VALID_EXIT = %w(yes ye y ey no n on)
MESSAGES = YAML.load_file('mortgage_messages_v2.yml')

def clear_screen
  system "clear"
end

def prompt(string)
  puts "=> #{string}"
end

def message_box(string)
  string.size.times { |_| print "-" }
  puts "\n"
  puts string
  string.size.times { |_| print "-" }
  puts "\n"
end

# Supported languages: english ('en'), spanish ('es')
def message(string, language = 'en')
  MESSAGES[language][string]
end

def display_header
  clear_screen
  message_box message 'title'
end

def valid_name?(string)
  !(string.empty? || string[0] == ' ')
end

def retrieve_name
  prompt message 'enter_name'
  name = ''
  loop do
    name = gets.chomp
    break if valid_name?(name)
    puts message 'invalid_name'
  end
  name
end

def display_welcome
  display_header
  retrieve_name
end

def valid_number?(input)
  (input.to_i.to_s == input || input.to_f.to_s == input) && input.to_f >= 0
end

def retrieve_loan_amount
  clear_screen
  prompt message 'enter_loan'
  loan_amount = ''
  loop do
    print "$"
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    puts message 'invalid_entry'
  end
  loan_amount
end

def retrieve_apr
  clear_screen
  prompt message 'enter_apr'
  apr = ''
  loop do
    print "%"
    apr = gets.chomp
    break if valid_number?(apr)
    puts message 'invalid_entry'
  end
  apr
end

def retrieve_duration_years
  clear_screen
  prompt message 'enter_duration'
  duration = ''
  loop do
    print message 'years'
    duration = gets.chomp
    break if valid_number?(duration)
    puts message 'invalid_entry'
  end
  duration
end

def calculate_duration_months(years)
  years.to_f * 12
end

def calculate_monthly_interest(annual_rate)
  (annual_rate.to_f / 12) / 100
end

def calculate_payment(amount, duration, interest)
  (amount.to_f * (interest / (1 - (1 + interest)**(-duration)))).round(2)
end

def display_results(payment)
  clear_screen
  print message 'results'
  puts payment.to_s
end

def valid_exit?(response)
  VALID_EXIT.include?(response)
end

def retrieve_go_again
  prompt message 'go_again'
  input = ''
  loop do
    input = gets.chomp
    break if valid_exit?(input.downcase)
    puts message 'invalid_exit'
  end
  input
end

def go_again?
  response = retrieve_go_again
  response.downcase.include?('n')
end

def main_loop
  loop do
    amount = retrieve_loan_amount
    apr = retrieve_apr
    duration_years = retrieve_duration_years
    monthly_int = calculate_monthly_interest(apr)
    duration_months = calculate_duration_months(duration_years)
    payment = calculate_payment(amount, duration_months, monthly_int)
    display_results(payment)
    break if go_again?
  end
end

def display_exit(input)
  print message 'goodbye'
  puts input.to_s
end

name = display_welcome
main_loop
display_exit(name)
