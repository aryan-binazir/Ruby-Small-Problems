def staggered_case(original_string)
  new_string = ''
  cap = true
  
  original_string.chars.each do |char|
    if cap
      new_string += char.upcase
    else
      new_string += char.downcase
    end
    cap = !cap
  end
  new_string
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'