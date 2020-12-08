# program randonly generates and print's Teddy's age.
# age is random number between 20 and 200.

random_age = rand(20..200)


puts("Please enter your name: ")
user_name = gets.chomp

if user_name.empty?
  name = "Teddy"
else
  name = user_name
end 
  


puts("#{name} is #{random_age} years old!")