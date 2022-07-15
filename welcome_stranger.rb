def greetings(arr, hsh)
  print "Hello, "
  while arr != []
    if arr.size == 1
      print "#{arr.shift}! "
    else
      print "#{arr.shift} "
    end
  end
  print "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
