# write a method that counts the number of occurances of each element in given array

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]



def count_occurrences(array)
	occurances = {}

	array.uniq.each do |element|
		occurances[element] = array.count(element)
	end

	occurances.each do |element, count|
		puts "#{element} => #{count}"
	end
end

count_occurrences(vehicles)



