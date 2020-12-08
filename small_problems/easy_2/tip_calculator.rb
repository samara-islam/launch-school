# prompt for bill amount and tip rate
# computer tip, display both tip and total amount of bill

def prompt(message)
	puts "=> #{message}"
end

prompt("What is the bill?")
bill_amount = gets.chomp.to_f

prompt("What is the tip percentage?")
tip_percentage = gets.chomp.to_f

tip_multiplier = tip_percentage / 100
tip_amount = (bill_amount * tip_multiplier).round(2)
total_bill = (bill_amount + tip_amount).round(2)

puts "The tip is #{tip_amount}."
puts "The total bill is #{total_bill}"