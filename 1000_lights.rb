
def thousand_lights(n)
  switches_arr = [1] * n
  count = 1
  output_arr = []

  loop do
    temp_count = count
  
    loop do
      if switches_arr[temp_count] == 0
        switches_arr[temp_count] = 1
      else
        switches_arr[temp_count] = 0
      end
      temp_count += (count + 1)
      break if temp_count >= n
    end
  
    count += 1
    break if count == n
  end
  switches_arr.each_with_index do |el, idx|
    output_arr << (idx + 1) if el == 1
  end
  output_arr
end

p thousand_lights(5) #=> 1 & 4 are on
p thousand_lights(10) #=> 1, 4 and 9 are on