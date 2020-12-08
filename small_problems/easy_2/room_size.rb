# ask user for length and width of room in meters
# display areas of the room in both square meters and feet
# 1 square meter = 10.7693 sq ft

puts "Enter the length of the room in meters: "
length_meters = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width_meters = gets.chomp.to_f

area_meters = length_meters * width_meters
area_feet = area_meters * 10.7639  

puts "The area of the room is #{area_meters} square meters (#{area_feet} sq ft)"