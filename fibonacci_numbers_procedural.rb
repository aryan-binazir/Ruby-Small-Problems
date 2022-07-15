def fibonacci(n)
  return 1 if n < 3
  first = 1
  second = 1
  fibo_num = 2
  
  3.upto(n) do |_|
    fibo_num = first + second
    first = second
    second = fibo_num
  end
  fibo_num
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501