
def ascii_value(str)
  total = 0
  parse_arr = str.split('')
  for char in parse_arr
    total += char.ord
  end
  total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
