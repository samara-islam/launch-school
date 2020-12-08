# method that takes one argument (array containing integers)
# return average of all numbers in array


def averager(arr)
  arr.sum.to_f / arr.size
end

p averager([1,6])

