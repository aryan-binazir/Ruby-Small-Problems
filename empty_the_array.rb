names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift #pop for reverse
  break if names.empty?
end