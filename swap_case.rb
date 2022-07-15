UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(input_string)
  output_arr = input_string.chars.map do |char|
    if LOWERCASE.include?(char)
      char.upcase
    elsif UPPERCASE.include?(char)
      char.downcase
    else
      char
    end
  end
  output_arr.join("")
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'