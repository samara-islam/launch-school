# write method that takes two arguments, a string and a positive integer.
# method should print that string as manu times as the integer indicates.

# define method, take str, int.
# for (int) times, print out the str.

def repeater(str, int)
	int.times {puts str}
end

repeater('hello',4)
