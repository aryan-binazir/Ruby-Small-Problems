def sum_square_difference(num)
  sum_of_squares = 0
  square_of_sum = 0
  
  1.upto(num) do |n|
    sum_of_squares += n**2 
    square_of_sum += n
  end
  (square_of_sum**2 - sum_of_squares).abs  
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150