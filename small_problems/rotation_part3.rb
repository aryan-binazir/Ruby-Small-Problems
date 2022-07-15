
def rotate_array(arr)
  output_arr = arr.dup
  first_element = output_arr.shift
  output_arr << first_element
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(num)
  n = num.to_s.length
  return num if n == 1

  loop do
    num = rotate_rightmost_digits(num, n)
    n -= 1
    break if n == 1
  end
  num
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845