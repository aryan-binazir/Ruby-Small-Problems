puts "Please enter a number to be evaluated between 0 and 100 "
number = gets.chomp.to_i

def number_checker(number_to_check)
  
  if number_to_check <= 50
    if number_to_check >= 0 
      puts "This number is between 0 and 50."
    else puts "This is an invalid number."
    end
  else 
    if number_to_check <= 100
      puts "This number is between 51 and 100."
    else puts "This is an invalid number."
    end
  end
end

number_checker(number)
