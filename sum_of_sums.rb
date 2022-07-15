def sum_of_sums(arr)
  counter = 0
  product = 0
  
  loop do
    arr[0..counter].each { |num| product += num }
    break if counter == arr.size - 1
    counter += 1
  end
  product
end



p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35