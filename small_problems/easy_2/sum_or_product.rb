# ask user for integer greater than 0
# ask if user wants to detirmine sum or product of all numbers between 
# 1 and the entered integer.

def compute_sum(number)
	number_array = [*1..number]
	number_sum = number_array.sum 
end

def compute_product(number)
	number_array = [*1..number]
	final = 1
	number_array.each { |i| final = final * i }
	final 
end



loop do 
	puts "Please enter an integer greater than 0: "
	user_number = gets.chomp.to_i
	
		if user_number > 0
		break
	else
		puts "Invalid response. Please try again."
	end
end


loop do
	puts "Enter 's' to compute sum, enter 'p' to compute product"
	user_choice = gets.chomp

	if user_choice == 's'
		puts "The sum of digits is #{compute_sum(user_number)}"
		break
	elsif user_choice == 'p'
		puts "The product of digits is #{compute_product(user_number)}"
		break
	else  
		puts "not a valid choice."
	end
end


