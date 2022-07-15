def missing(sorted_array)
  results_arr = []
  current_num = sorted_array[0]
  last_num = sorted_array[-1]

  loop do
    break if current_num == last_num
    results_arr << current_num unless sorted_array.include?(current_num)
    current_num += 1
  end
  results_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []