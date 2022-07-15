def greeting(name)
  puts "Hey " + name + "! How are you?"
end

puts "What is your name? "
your_name = gets.chomp

greeting(your_name)