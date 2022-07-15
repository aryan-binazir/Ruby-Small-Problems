def word_to_digit(input_str)
  num_hsh = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
  
  num_hsh.keys.each do |key|
    input_str.gsub!(key, num_hsh[key])
  end
  input_str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'