USERNAME = "Marcus_Rashford"
PASSWORD = "Passwordy123"


loop do
  print "\nPlease enter your user name: "
  username_try = gets.chomp
  print "\nPlease enter your password: "
  password_try = gets.chomp
  break if (username_try.downcase == USERNAME.downcase && password_try == PASSWORD)
  puts "Wrong username or password, try again."
end

puts "\nUser name and password accepted. Welcome!"