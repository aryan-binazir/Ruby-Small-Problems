def crunch(input_str)
  output_str = ''
  input_str.chars.each do |character|
    output_str += character if output_str[-1] != character
  end
  output_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''