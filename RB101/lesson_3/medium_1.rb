# ASCII art. One line program that creates an output 10 times,
# with subsequent line indented 1 space to the right.

string = "The Flinstones Rock!"

10.times { |number| puts (">" * number) + string}

# fix the error
puts "the value of 40 + 2 is " + (40 + 2).to_s
# can also use string interpolations
puts "The value od 18 and 20 is #{18+20}" 

# fix method so that is cannot accept 0 or less.

def factors(number)
  divisor = number
	factors = []
	if number > 0
  	begin
    	factors << number / divisor if number % divisor == 0
    	divisor -= 1
  	end until divisor == 0
		factors
	else 
		puts "Not a valid input."
	end 
end

# Here's a much better way:

def factors_better(number)
  divisor = number
  factors = []
	while divisor > 0 do
		factors << number / divisor if number % divisor == 0
		divisor -= 1
	end
  factors
end

p factors_better(10)
p factors_better(0)
p factors_better(-5) 

  