# takes grocery list as array of fruits with quantities.
# converts array to correct number of each fruit.

def buy_fruit(grocery_list)
  return_arr = []

  grocery_list.each do |arr|
    arr[1].times { return_arr << arr[0] }
  end
  return_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
