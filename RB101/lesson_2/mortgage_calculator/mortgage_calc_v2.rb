def clear_screen
	system "clear"
end

clear_screen

def valid_number?(input)
	input.to_i.to_s == input || input.to_f.to_s == input
end

def retrieve_loan_amount
	puts "enter loan amount in USD"
	loan_amount = ''
	loop do
		loan_amount = gets.chomp
		break if valid_number?(loan_amount)
		puts "incorrect"
	end
	loan_amount
end

def retrieve_apr
	puts "enter apr as percentage (x.xx)"
	apr = ''
	loop do
		apr = gets.chomp
		break if valid_number?(apr)
		puts "incorrect"
	end
	apr
end

def retrieve_duration_years
	puts "enter duration in years:"
	duration = ''
	loop do
		duration = gets.chomp
		break if valid_number?(duration)
		puts "incorrect"	
	end
	duration
end

def calculate_duration_months(years)
  years.to_f * 12
end

def calculate_monthly_interest(annual_rate)
  (annual_rate.to_f / 12) / 100
end

def calculate_monthly_payment(amount, duration, interest)
  (amount.to_f * (interest / (1 - (1 + interest)**(-duration)))).round(2)
end

def display_results(payment)
	puts "the monthly payment is $#{payment}"
end

amount = retrieve_loan_amount
apr = retrieve_apr
duration_years = retrieve_duration_years
monthly_interest_rate = calculate_monthly_interest(apr)
duration_months = calculate_duration_months(duration_years)
monthly_payment = calculate_monthly_payment(amount, duration_months, monthly_interest_rate)
display_results(monthly_payment)