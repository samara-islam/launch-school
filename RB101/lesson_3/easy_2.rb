ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see is "Spot" is present

p ages.has_key?("Herman")
p ages.has_key?("Spot")

p ages.include?("Herman")
p ages.include?("Spot")

p ages.member?("Herman")
p ages.member?("Spot")

munsters = "The Munsters are creepy in a good way."

# convert the string in the following ways:
string1 = "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
string2 = "The munsters are creepy in a good way."
string3 = "the munsters are creepy in a good way."
string4 = "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

p part1 = munsters.swapcase
p part2 = munsters.capitalize
p part3 = munsters.downcase
p part4 = munsters.upcase

# add to original hash 
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

p ages

# see if the name "Dino" appears in the string 
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")
p advice.match?("Dino")
p advice.include?("things")
p advice.match?("things")

# not perfect because it will match any substring with Dino in it.
# this is a better way of solving the problem
p advice.split.include?("Dino")

# show easier way to write this array
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

p fs = %w(Fred Barney Wilma Betty BamBam Pebbles)

# add Dino to the array

fs << 'Dino'
p fs

# add multiple items to array at once

flintstones.push("Dino","Hoppy")
p flintstones

# shorten this sentence. Remove everything starting from 'house'
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))

# write one-liner to cunt number of lower-case 't' characters
statement = "The Flintstones Rock!"

p statement.count('t')

# center title above a 40-character wide table
title = "Flintstone Family Members"

p title.center(40)