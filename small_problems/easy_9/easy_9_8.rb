# takes two integers as arguments
# first integer is a count
# second integer is number of a sequence
# return array containing same number of elements as the count
# values of each element will be multiples of starting number

# 1. Initialize return_array
# 2. set og_num = num
# 3. Loop count.times:
#     return array << number
#     number = number + og_number

def sequence(count, start)
  return_array = []
  num = start

  count.times do
    return_array << num
    num += start
  end
  return_array
end

p sequence(5, 1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 1000000)
