def sequence(last)
  current = 1
  arr = []
  loop do
    arr << current
    break if current == last
    current += 1
  end
  arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]