ALPHABETIC = ('A'..'Z').to_a + ('a'..'z').to_a

def staggered_case(original_string)
  new_string = ''
  caps = true
  
  original_string.chars.each do |char|
    if ALPHABETIC.include?(char)
      if caps
        new_string += char.upcase
      else
        new_string += char.downcase
      end
      caps = !caps
    else 
      new_string += char
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'