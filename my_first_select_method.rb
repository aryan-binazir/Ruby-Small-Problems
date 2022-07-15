def select(arr)
  counter = 0
  return_arr = []
  
  while counter < arr.size
    element = arr[counter]
    return_arr << element if yield(element)
    counter += 1
  end
  return_arr
end

array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true