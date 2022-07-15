def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  integer_1 = nil
  integer_2 = nil

  loop do
    print "Please enter your first integer:  "
    integer_1 = gets.chomp
    break if valid_number?(integer_1)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  loop do
    print "Please enter your first integer:  "
    integer_2 = gets.chomp
    break if valid_number?(integer_2)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  addition = integer_1.to_i + integer_2.to_i
  if (integer_1.to_i * integer_2.to_i).negative?
    puts "The addition of these 2 numbers is #{addition}"
    break
  else
    puts "One number should be negative and one should be positive, let's try this again."
  end
end
