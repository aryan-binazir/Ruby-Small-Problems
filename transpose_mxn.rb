
def transpose(matr)
  output_arr = []
  matr[0].size.times { |_| output_arr << [] }
  index1 = 0

  loop do
    index2 = 0
    loop do
      p output_arr
      output_arr[index1] << matr[index2][index1]
      break if index2 == matr[0].size - 1
      index2 += 1
    end
    break if index1 == matr.size - 1
    index1 += 1
  end
  output_arr
end

p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
# transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# transpose([[1]]) == [[1]]2], [3, 9, 6]]
