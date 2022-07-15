def include?(arr, var)
  return false if arr.size == 0
  arr.each { |element| return true if element == var }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false