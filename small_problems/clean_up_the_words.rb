ALPHABET = ('a'..'z').to_a

def cleanup(input_str)
  output_str = ''
  fixing_arr = input_str.split('')
  fixing_arr.each do |char|
    if ALPHABET.include?(char)
      output_str += char
    elsif output_str[-1] != ' '
      output_str += ' '
    end
  end
  output_str
end

cleanup("---what's my +*& line?") == ' what s my line '
