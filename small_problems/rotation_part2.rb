def rotate_array(arr)
  output_arr = arr.dup
  first_element = output_arr.shift
  output_arr << first_element
end

def rotate_rightmost_digits(num, rotate)
  return rotate_array(num.digits.reverse).join.to_i if rotate == 6
  
  num_length = num.to_s.length
  first_arr = num.digits.reverse[0..num_length - rotate - 1]
  second_arr = rotate_array(num.digits.reverse[num_length - rotate..-1])
  (first_arr + second_arr).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
