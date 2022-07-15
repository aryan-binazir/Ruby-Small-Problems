def interleave(arr1, arr2)
  output_arr = []
  loop do
    output_arr << arr1.shift
    output_arr << arr2.shift
    break if arr2.size ==0
  end
  output_arr
end
  
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']