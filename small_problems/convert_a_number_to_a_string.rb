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

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
