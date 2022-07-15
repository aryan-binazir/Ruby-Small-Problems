puts "What would you like to capitalize(More than 10 characters, please)? "
sentence = gets.chomp

def capitalize(string_to_check)
  if string_to_check.length > 10
    string_to_check.upcase!
  end
end

capitalize(sentence)
puts sentence