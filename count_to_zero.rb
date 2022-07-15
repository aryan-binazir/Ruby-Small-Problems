def countdown(number)
  if number <= 0 
    puts number
  else 
    puts number
    countdown(number-1)
  end
end

print "What number would you like to count down from? "
n = gets.chomp.to_i
countdown(n)