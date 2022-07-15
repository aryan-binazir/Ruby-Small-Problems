def merge(arr1, arr2)
  results_arr = []
  
  loop do
    items_left = (arr1 + arr2) - results_arr
      break if items_left.empty?
    1.upto(9) do |num|
      loop do
        item_count = (arr1 + arr2).count(num)
        item_count.times do 
          results_arr << num if items_left.include?(num)
        end
        items_left = (arr1 + arr2) - results_arr
        break unless items_left.include?(num)
      end
    end
  end
  results_arr
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]