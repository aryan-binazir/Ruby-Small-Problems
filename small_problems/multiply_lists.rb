def multiply_list(arr1, arr2)
  output_arr = []
  arr1.each_with_index do |element, index|
    output_arr << element * arr2[index]
  end
  output_arr
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


# further exploration

=begin
def multiply_list(arr1, arr2)
  arr3 = arr1.zip(arr2).map { |subarray| subarray[0] * subarray[1]} 
  arr3
end
=end
