
puts "What is your name?"
name = gets.chomp
name_array = name.split('')

if name_array.last == "!"
  name_array.pop
  puts "HELLO #{name_array.join('').upcase}. WHY ARE WE SCREAMING?"
else 
  puts "Hello #{name_array.join('')}."
end
