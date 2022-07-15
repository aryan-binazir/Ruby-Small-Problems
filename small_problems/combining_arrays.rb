
def merge(arr1, arr2)
  new_arr = []
  new_arr = arr1

  arr2.each do |element|
    new_arr << element if !(new_arr.include?(element))
  end
  new_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]