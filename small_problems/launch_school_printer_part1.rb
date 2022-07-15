number = nil

loop do
  puts "How many times would you like us to tell you? "
  number = gets.to_i
  break if number >= 3
  puts "You need to say it at least 3 times, come on!"
end

number.times { puts 'Launch School is the best!'}
