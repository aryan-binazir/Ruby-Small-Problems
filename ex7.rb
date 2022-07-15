football_clubs = [
  "Manchester United",
  "Arsenal FC",
  "Barcelona FC",
  "Real Madrid",
  "Bayern Munich",
]

football_clubs.each_with_index do |team, index|
  puts "#{index + 1}. #{team}"
end 
