arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

test = arr.sort_by do |subarray|
  subarray.select do |element|
    element.odd?
  end
end
