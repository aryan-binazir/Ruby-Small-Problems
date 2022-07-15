puts "Please write word or multiple words:"
sentence = gets.chomp

length = sentence.delete(' ').size

puts "There are #{length} characters in \"#{sentence}\""
