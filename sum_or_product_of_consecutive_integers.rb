puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

output = ''

if operator == 's'
  output = 0
  (1..number).each do |num|
    output += num
  end
elsif operator == 'p'
  output = 1
  (1..number).each do |num|
    output = num * output
  end
end

puts "The product of the integers between 1 and #{number} is #{output}."

