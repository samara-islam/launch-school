def twice(num)
  # split into two equal arrays
  arr = num.to_s.split('')
  left, right = arr.each_slice((arr.size / 2.0).round).to_a
  # check if left array equals right array
  result = left == right
  # return twice number if arrays are not equal
  # otherwise, return number as-is.
  case result
  when true
    num
  when false
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334_433) == 668_866
p twice(444) == 888
p twice(107) == 214
p twice(103_103) == 103_103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
