# ask for user name
# return welcome with name
# if name inludes ! then shout back a response (all caps)

puts "What is your name?"
user_name = gets.chomp

if user_name[-1] == "!"
	user_name = user_name.upcase.chop 
	puts "HELLO #{user_name}. WHY ARE WE SCREAMING?"
else
	puts "Hello, #{user_name}"
end 