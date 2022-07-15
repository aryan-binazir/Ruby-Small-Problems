numbers = {
  high:   100,
  medium: 50,
  low:    10
}

 half_numbers = numbers.map do |symbol, number|
                  number/2 
                end 

puts half_numbers