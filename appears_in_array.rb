print "Enter the number you would like to check in the array: "
number = gets.chomp.to_i

arr = [1,3,5,7,9,11]
if arr.include?(number)
  puts "#{number} is in the array"
else
  puts "#{number} is not in the array"
  
end
