def halvsies(arr)
  return_arr = [[],[]]
  count = 0
  left_index = 0
  right_index = ( arr.size / 2 )
  right_index += 1 if arr.size.odd?
  midpoint = ( ( arr.size / 2) - 1 )
  loop do
    break if left_index > midpoint
    return_arr[0] << arr[left_index]
    return_arr[1] << arr[right_index]
    left_index += 1
    right_index += 1
  end
  return_arr[0] << arr[left_index] if arr.size.odd?
  return_arr
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]