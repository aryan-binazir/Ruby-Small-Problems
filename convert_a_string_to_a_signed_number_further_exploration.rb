CONVERSION_CHART = {  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9  }

def string_to_integer(number)
  output_arr = []
  number.split('').each do |num|
    output_arr << CONVERSION_CHART[num]
  end
  value = 0
  output_arr.each { |n| value = 10 * value + n }
  value
end

def string_to_signed_integer(string)
  signage = string[0] == '-' ? -1 : 1
  string = string[1..-1] if string[0] == '+' || string[0] == '-'
  signage * string_to_integer(string)
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
