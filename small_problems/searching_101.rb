numbers = []
counter = 1

loop do
  puts "Enter number #{counter} of 6"
  answer = gets.chomp.to_i
  numbers << answer
  counter += 1
  break if counter > 6
end

last_number = numbers.pop

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
