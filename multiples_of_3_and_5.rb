
def multisum(top_number)
  return_arr = []
  current_number = 2
  total = 0

  loop do
    return_arr << current_number if 
      current_number % 3 == 0 || current_number % 5 == 0
    current_number += 1
    break if current_number > top_number
  end
  return_arr.inject { |sum, n| sum + n }
  #return_arr.each { |number| total += number.to_i }
  #total
end


multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
