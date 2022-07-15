PASSWORD = "Passwordy123"


loop do
  print "\nPlease enter your password: "
  password_try = gets.chomp
  break if password_try == PASSWORD
  puts "Wrong password, try again."
end

puts "\nPassword accepted. Welcome!"