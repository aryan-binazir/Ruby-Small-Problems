def diamond(n)
  gap = (n - 1) / 2
  diamonds = 1
  if n == 1
    puts "    *    " 
  end
  
  loop do
    break if n == 1
    print ' ' * gap
    print '*' * diamonds
    puts ' ' * gap
    diamonds += 2
    gap = (n - diamonds) / 2
    break if diamonds > n
  end
  
  diamonds -= 2
  
  loop do
    break if n == 1
    diamonds -= 2
    gap = (n - diamonds) / 2
    print ' ' * gap
    print '*' * diamonds
    puts ' ' * gap
    break if diamonds == 1
  end
  
end

diamond(1)
diamond(5)
diamond(9)
diamond(20)