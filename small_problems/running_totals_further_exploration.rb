require "pry"

def running_total(input_arr)
return_arr = []
  input_arr.each_with_index do |index, value|
    return_arr[index] = return_arr[index - 1] + input_arr[index]
  end
  p return_arr
end




p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
