names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def sentence (chosen_name, chosen_activity)
  puts "#{chosen_name} went #{chosen_activity} today!"
end

def name (arr)
  arr.sample
end

def activity (arr)
  arr.sample
end

puts sentence(name(names), activity(activities))
