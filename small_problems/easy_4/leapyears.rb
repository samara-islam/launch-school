# Leap years occur in every year that is evenly divisible by 4, 
# unless the year is also divisible by 100.
# IF the year if evenly divisible by 100, then it is not a leap year 
# uless the year is evenly divisible by 400.

# assume this rule is good for any year greater than 0.
# write method that takes any year greater than 0 as input.
# returns true if year is a leap year, false if not leap year.

def leap_year?(year)
	(year % 4 == 0 && year % 100 != 0) ||	
	(year % 100 == 0 && year % 400 == 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# the British Empire adopted the Gregorian clander in 1752, which was a leap year.
# Prior to 1752, the Julian Calendar was used. Under the Julian calander, 
# leap years occured in any year that is evenly divisibly by 4.

# Using this information, update the method to detirmine leap years
# both before and after 1752.

def leap_year_advanced?(year)
	if (year < 1972) && (year % 4 == 0) 
		true
	else
		(year % 4 == 0 && year % 100 != 0) ||	
		(year % 100 == 0 && year % 400 == 0)
	end
end

leap_year_advanced?(2016) == true
leap_year_advanced?(2015) == false
leap_year_advanced?(2100) == false
leap_year_advanced?(2400) == true
leap_year_advanced?(240000) == true
leap_year_advanced?(240001) == false
leap_year_advanced?(2000) == true
leap_year_advanced?(1900) == false
leap_year_advanced?(1752) == true
leap_year_advanced?(1700) == true
leap_year_advanced?(1) == false
leap_year_advanced?(100) == true
leap_year_advanced?(400) == true