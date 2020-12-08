# method takes one argument (postive integer)
# returns sum of digits

def sum(integer)
  integer.to_s.split('').map { |element| element.to_i }.sum 
end

p sum(123_456_789)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45