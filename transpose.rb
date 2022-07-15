
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matr)
  output_arr = []
  matr[0].size.times { |_| output_arr << [] }
  index1 = 0

  loop do
    index2 = 0
    loop do
      output_arr[index1] << matr[index2][index1]
      break if index2 == matr[0].size - 1
      index2 += 1
    end
    break if index1 == matr[0].size - 1
    index1 += 1
  end
  output_arr
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
