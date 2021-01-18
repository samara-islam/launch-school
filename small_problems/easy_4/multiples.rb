# search for all multiples of 3 and 5 between 1 and some other number.
# compute the sum of those multiples

# search for all multiples

def multisum(number)
	box = []
	while number > 0
		box << number if number % 3 == 0 || number % 5 == 0
		number -= 1
	end
	sum = 0
	box.each { |e| sum += e }
end
 
p multisum(20)



# compute sum of multiples