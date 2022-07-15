
def buy_fruit(arr)
  correct_num = []
  arr.each do |subarray|
    subarray[1].times { |element| correct_num << subarray[0] }
  end
  correct_num
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
