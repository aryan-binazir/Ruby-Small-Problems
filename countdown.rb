def decrease(counter)
  counter -= 1
end

counter = 10

while counter > 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'