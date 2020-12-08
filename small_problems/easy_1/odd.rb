# method takes one integer argument.
# method returns true if number's absolute value is odd.

def is_odd?(integer)
	integer.abs % 2 == 1
	
end

p is_odd?(2)
p is_odd?(3)