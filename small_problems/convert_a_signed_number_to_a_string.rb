NUMBERS = ['0','1','2','3','4','5','6','7','8','9']

def integer_to_string(number)
  final_number = ''
  loop do
    number, remainder = number.divmod(10)
    final_number.prepend(NUMBERS[remainder])
    break if number == 0
  end
  final_number
end

def signed_integer_to_string(number)
  if number.positive?
    return = integer_to_string(number)
  else
    return = integer_to_string(number * -1)
  end
  puts return
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'