def average(arr)
  count = arr.size
  total_number = 0

  arr.each do |current_number|
    total_number += current_number
  end

  # total_number.to_f / count for further exploration
  total_number / count
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
