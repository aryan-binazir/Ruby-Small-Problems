vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicles)
  vehicles_count = {}
  vehicles.map(&:downcase!) #adjust for case insensitive 

  vehicles.uniq.each do |element|
    vehicles_count[element] = vehicles.count(element)
  end
  vehicles_count.each do |vehicle_type, counter|
    puts "#{vehicle_type} => #{counter}"
  end
end

count_occurrences(vehicles)
