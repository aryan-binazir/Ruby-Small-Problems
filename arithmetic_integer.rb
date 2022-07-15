second_number = ''

puts "Enter the first number."
first_number = gets.chomp.to_i

loop do
puts "Enter the second number, may not be 0."
second_number = gets.chomp.to_i
break if second_number != 0
end

puts "#{first_number} + #{second_number} = #{first_number + second_number}"
puts "#{first_number} - #{second_number} = #{first_number - second_number}"
puts "#{first_number} * #{second_number} = #{first_number * second_number}"
puts "#{first_number} / #{second_number} = #{first_number / second_number}"
puts "#{first_number} % #{second_number} = #{first_number % second_number}"
puts "#{first_number} ** #{second_number} = #{first_number**second_number}"
