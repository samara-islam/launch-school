# method takes one argument (positive integer)
# returns a list of the digits in the numbers

def lister(int)
	int.to_s.split('').map { |element| element.to_i }
end

p lister(1234)

p lister(3216)

p lister(123)

puts lister(12345) == [1, 2, 3, 4, 5]     # => true
puts lister(7) == [7]                     # => true
puts lister(375290) == [3, 7, 5, 2, 9, 0] # => true
puts lister(444) == [4, 4, 4]             # => true