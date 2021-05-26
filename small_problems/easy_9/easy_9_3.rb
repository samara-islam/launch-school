# takes number as argument
# if num > 0, return -num
# else, return num as-is.

def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
