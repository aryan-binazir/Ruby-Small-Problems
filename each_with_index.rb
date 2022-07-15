def each_with_index(input_array)
  counter = 0
  while counter < input_array.size
    yield(input_array[counter], counter)
    counter += 1
  end
  input_array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# should output
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true