
CONVERSION_CHART = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(number)
  output_arr = []

  number.split('').each do |num|
    output_arr << CONVERSION_CHART[num]
  end 
  value = 0
  output_arr.each { |n| value = 10 * value + n }
  value
end





p string_to_integer('4321') == 4321
p string_to_integer('570') == 570