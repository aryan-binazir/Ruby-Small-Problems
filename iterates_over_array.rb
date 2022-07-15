original_arr = [1,3,4,1341,1,3,34134,134,7,4,324,14,34,234,321,46,35,356,2,436,3426,436,41,461,64,4525]
modified_arr = []

original_arr.each do |value|
  modified_arr.push(value + 2)
end
p "Original array is #{original_arr}\n\n"
p "Modified array is #{modified_arr}" 