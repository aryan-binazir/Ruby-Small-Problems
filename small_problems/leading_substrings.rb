

def leading_substrings(str)
  combinations = []
  counter = 0

  loop do
    combinations << str[0..counter]
    break if counter == str.chars.size - 1
    counter += 1
  end
  combinations
end



p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
