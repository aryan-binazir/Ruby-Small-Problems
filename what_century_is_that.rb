
def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11,12,13].include?(century % 100)
  last_digit = century % 10

  case last_digit.to_s
  when '0'
    'th'
  when '1'
    'st'
  when '2'
    'nd'
  when '3'
    'rd'
  when '4' || '5' || '6' || '7' || '8' || '9'
    'th'
  end
  
end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
