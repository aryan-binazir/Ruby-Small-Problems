def is_palindrome?(str)
  if str.length <= 1
    return false
  end
  str == str.reverse
end

def palindromes(str)
  sbstr = []
  counter = 0
  loop do
    interior_start = counter
    interior_end = counter
    loop do
      sbstr << str[interior_start..interior_end] if is_palindrome?(str[interior_start..interior_end])
      break if interior_end == str.size - 1
      interior_end += 1
    end
  break if counter == str.length - 1
  counter += 1
  end
  sbstr
end





p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]