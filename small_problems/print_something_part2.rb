puts "Would you like me to print something? (y/n)"

loop do
answer = gets.chomp
  if answer.downcase == "y" 
    puts "something"
    break
  elsif answer.downcase == "n"
    break
  else
    puts "That answer wasn't (y/n), please try again."
  end
end