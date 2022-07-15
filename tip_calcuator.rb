puts("What is the bill?")
bill = gets.chomp.to_f

puts("What is the tip percentage?")
tip_percent = gets.chomp.to_f

tip_total = (bill * (tip_percent / 100)).round(2)
total = (bill + tip_total).round(2)

puts("The tip is $#{sprintf("%.2f", tip_total)}")
puts("The total is $#{sprintf("%.2f", total)}")