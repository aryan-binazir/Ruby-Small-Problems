def what_age
  puts("What is your name?")
  name = gets.chomp
  name = "Teddy" if name == ''
  puts("#{name} is #{rand(20..200)} years old!")
end

what_age