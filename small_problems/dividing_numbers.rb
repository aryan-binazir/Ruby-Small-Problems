def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

puts "Let's divide today!"
numerator = nil
denominator = nil

loop do
  puts "\nPlease enter a numerator!"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "That is not a valid integer."
end

loop do
  puts "\nPlease enter a denominator!"
  denominator = gets.chomp
  break if valid_number?(denominator) && denominator.to_i != 0
  puts "That is not a valid integer."
end

result = numerator.to_i / denominator.to_i
puts result
puts "\n#{numerator} / #{denominator} is #{result}"

