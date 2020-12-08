# print all odd numbers 1 - 99 inclusive.
# each number prints on seperate line

number_box = [*0..99]

number_box.each do |element|
	if element % 2 != 0
		puts element 
	else
		next
	end
end 