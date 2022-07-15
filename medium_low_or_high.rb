numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select do |symbol, number|
                number < 25
              end
puts low_numbers