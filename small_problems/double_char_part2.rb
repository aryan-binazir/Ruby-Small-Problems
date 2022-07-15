CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(str)
  doubled_str = ''
  str.chars.each do |char| 
    if CONSONANTS.include?(char.downcase) 
      doubled_str += char * 2
    else
      doubled_str += char
    end
  end
  doubled_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""