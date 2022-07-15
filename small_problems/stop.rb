loop do
  
puts "Type STOP if you want to stop: "
shall_we_stop = gets.chomp.downcase

  if shall_we_stop == "stop"
    puts "Now we will stop!"
    break
  else 
    puts "You didn't type stop so on we go!\n"
  end
end
