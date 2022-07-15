def substrings(str)
  sbstr = []
  counter = 0
  loop do
    interior_start = counter
    interior_end = counter
    loop do
      sbstr << str[interior_start..interior_end]
      break if interior_end == str.size - 1
      interior_end += 1
    end
  break if counter == str.length - 1
  counter += 1
  end
  sbstr
end



p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]