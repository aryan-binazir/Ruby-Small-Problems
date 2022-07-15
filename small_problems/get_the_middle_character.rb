
def center_of(str)
  middle = str.length / 2
  return str[middle] if str.length.odd?
  return str[middle-1..middle] if str.length.even?
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'