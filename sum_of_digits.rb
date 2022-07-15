def sum(input_number)
  total = 0

  arr = input_number.to_s.split('')
  arr.each do |element|
    total += element.to_i if element.to_i.is_a? Integer
  end
  
  total
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
