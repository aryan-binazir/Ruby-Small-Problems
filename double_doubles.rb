
def twice(num)
  num_string = num.to_s
  middle = num_string.size / 2
  left_side = middle.zero? ? '' : num_string[0..middle - 1]
  right_side = num_string[middle..-1]

  return num if left_side == right_side
  num * 2
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
