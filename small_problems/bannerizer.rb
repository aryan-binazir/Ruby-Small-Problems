
def print_in_box(str)
  horizonal_line = "+#{'-' * (str.size + 2)}+"
  empty_line = "|#{' ' * (str.size + 2)}|"
  puts horizonal_line
  puts empty_line
  puts "| #{str} |"
  puts empty_line
  puts horizonal_line
end


print_in_box('')
print_in_box('To boldly go where no one has gone before.')