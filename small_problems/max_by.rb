def max_by(array)
  return nil if array.empty?
  max_input = array.first
  max_yielded = yield(max_input)

  array[1..-1].each do |num|
    yielded_val = yield(num)
    if yielded_val > max_yielded
      max_yielded = yielded_val
      max_input = num
    end
  end
  max_input
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil