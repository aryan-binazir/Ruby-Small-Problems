def factorial(num)
  factorials = Enumerator.new do |f|
    counter = 1
    total = 1

    loop do
      counter += 1
      f << total
      total *= counter
    end
  end
  factorials.take(num).last
end

p factorial(7)