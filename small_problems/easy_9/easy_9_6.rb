# takes string as argument
# returns array containing every word from string and a word
# length.

# convert str into array of delimited string elements
# initialize new array to hold return values
# iterate over string array,
#  push "#{element} #{element.length}" into empty array.

def word_lengths(str)
  return_arr = []
  working_arr = str.split(' ')

  working_arr.each do |element|
    return_arr << "#{element} #{element.length}"
  end
  return_arr
end

p word_lengths('cow sheep chicken')
p word_lengths('baseball hot dogs and apple pie')
p word_lengths("It ain't easy, is it?")
p word_lengths('Supercalifragilisticexpialidocious')
