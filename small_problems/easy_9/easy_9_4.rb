# takes one integer argument
# returns array with element counting from 1 to integer.

# take integer as argument
# set counter to 1
# initialize empty array
# append array with counter
# increment counter by one
# stop loop after integer.size times

def sequence(int)
  counter = 1
  sequence = []

  int.times do
    sequence << counter
    counter += 1
  end
  sequence
end

sequence(5) # == [1, 2, 3, 4, 5]
sequence(3) # == [1, 2, 3]
sequence(1) # == [1]
