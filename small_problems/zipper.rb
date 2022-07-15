def zip(arr1, arr2)
  counter = 0
  result_array = []

  loop do
    break if counter == arr1.size
    result_array << [arr1[counter], arr2[counter]]
    counter += 1
  end
  result_array
end



p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]