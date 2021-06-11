# Write a method that takes an Array of numbers and then 
# returns the sum of the sums of each leading subsequence for 
# that Array. You may assume that the Array always contains at 
# least one number.

# initialize accumulator and total_sum variables
# for every number in array, add number to accumulator
#   add accumulator to total_sum
# return total_sum 

def sum_of_sums(arr)
  accumulator = 0
  total = 0

  arr.each do |num|
    accumulator += num
    total += accumulator
  end

  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35