FEET_TO_INCHES = 12
FEET_TO_CENTIMETERS = 30.48

puts("Enter the length of the room in in feet: ")
length = gets.chomp.to_f

puts("Enter the width of the room in feet:")
width = gets.chomp.to_f

area_in_sq_feet = length * width
area_in_sq_inches = area_in_sq_feet * FEET_TO_INCHES
area_in_sq_cm = area_in_sq_feet * FEET_TO_CENTIMETERS

puts("The area of the room is #{area_in_sq_feet} square feet, #{area_in_sq_inches} square inches or #{area_in_sq_cm} square cm.")