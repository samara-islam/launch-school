# takes string as argument
# if all chars upcase, return true
# else, return false

# does string.upcase == string?
# if yes, return true
# else, return false

def uppercase?(str)
  str.upcase == str
end

p uppercase?('t') # == false
p uppercase?('T') # == true
p uppercase?('Four Score') # == false
p uppercase?('FOUR SCORE') # == true
p uppercase?('4SCORE!') # == true
