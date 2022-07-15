a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']

arr = []

arr = a.map { |words| words.split(" ").flatten} 
arr.flatten!
print arr