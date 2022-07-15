def multiply(num_1, num_2)
  num_1 * num_2
end

def square(num)
  multiply(num, num)
end

def to_power(num, to_power_of)
  answer = num

  loop do
    answer = multiply(answer, num)
    to_power_of -= 1
    break if to_power_of == 1
  end
  answer
end
