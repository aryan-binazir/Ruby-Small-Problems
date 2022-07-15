# 3 options below as asked for in exercises

def oddities(arr)
  every_other = []
  arr.map.with_index do |value, index|
    every_other << value if index.even?
  end
  every_other
end

# another option
=begin
def oddities(arr)
  every_other = []
  counter = 0

  loop do
    break if counter >= arr.size
    every_other << arr.fetch(counter)
    counter += 2
  end
  every_other
end
=end

# another option
=begin
  loop do
    break if counter == arr.size
    every_other << arr.fetch(counter) if counter.even?
    counter += 1
  end
  every_other
end
=end

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []