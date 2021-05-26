# takes name as string "firstname lastname"
# # return string formated as "lastname, firstname"

# convert string to array
# return "#{array[1]}, array[0]}"

def swap_name(str)
  arr = str.split(' ')
  "#{arr[1]}, #{arr[0]}"
end

p swap_name('Joe Roberts')
