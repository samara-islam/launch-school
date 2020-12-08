# write a method that takes one argument, a string, 
# and resturns a new string with the words in reverse order

def reverse_sent(str)
	p str.split.reverse.join(' ')
end

reverse_sent('this is a sentance that is misspelled')