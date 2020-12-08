# method takes two arguments (positive integer, boolean)
# calculates bonus for salary 
# if boolean == true, bonus is half of salary
# if boolean == false, bonus is 0.

def calculate_bonus(salary, boolean)
  boolean ? (salary/2.0) : 0
end 



puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

