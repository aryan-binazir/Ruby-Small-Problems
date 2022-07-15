puts("What is your age? ")
age = gets.chomp.to_i

puts("At what age would you like to reture? ")
retirement_pref = gets.chomp.to_i

years_left = retirement_pref - age
current_year = Time.new.year
retirement_year = current_year + years_left

puts("It's #{current_year}, you will retire in #{retirement_year}")
puts("You have only 40 years of work to go!")