NUMBER_ARRAY = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(input_arr)
  input_arr.sort do |a,b| 
    NUMBER_ARRAY[a] <=> NUMBER_ARRAY[b] 
  end
end

  p alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]
