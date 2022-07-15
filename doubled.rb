numbers = [1, 2, 3, 4, 5]
doubled = []

numbers.map do |number|
  doubled.push(number * 2)
end

puts doubled