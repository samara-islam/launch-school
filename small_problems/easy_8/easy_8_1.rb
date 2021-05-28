# Write a method that takes an Array of numbers 
# and then returns the sum of the sums of each leading 
# subsequence for that Array. 
# You may assume that the Array always contains at least 
# one number.

def sum_of_sums(num_array)
  # initialize loop counter
  counter = 0

  # initialize accumulator and sum_total
  accumulator = 0
  sum_total = 0

  # loop over array. 
  loop do
    accumulator = accumulator + num_array[counter]
    sum_total = sum_total + accumulator
    counter = counter + 1

    break if counter == num_array.size
  end

  sum_total
end

p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])
