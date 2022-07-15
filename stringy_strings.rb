def stringy(current_number, starting_number = '1')
  output_number = ''

  loop do
    puts "Switch to starting with 0? Y/N"
    answer = gets.chomp
    if answer.downcase.start_with?('n')
      break
    elsif answer.downcase.start_with?('y')
      starting_number = '0'
      break
    end
    break
  end

  if starting_number == '1'
    current_number.times do |index|
      current_number = index.odd? ? '0' : '1'
      output_number << current_number
    end

  elsif starting_number == '0'
    current_number.times do |index|
      current_number = index.odd? ? '1' : '0'
      output_number << current_number
    end
  end

  output_number
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
