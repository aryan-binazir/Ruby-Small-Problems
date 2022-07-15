SQM_TO_SQFT = 10.7639

puts("Enter the length of the room in meters: ")
length = gets.chomp.to_f

puts("Enter the width of the room in meters:")
width = gets.chomp.to_f

area_in_sq_meters = length * width
area_in_sqft = area_in_sq_meters * SQM_TO_SQFT

puts("The area of the room is #{area_in_sq_meters} square meters (#{area_in_sqft} square feet).")