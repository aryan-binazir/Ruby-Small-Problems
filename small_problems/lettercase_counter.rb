UPPERCHAR = ('A'..'Z').to_a
LOWERCHAR = ('a'..'z').to_a

def letter_case_count(str)
  store = { lowercase: 0, uppercase: 0, neither:0 } 
  str.chars.each do |char|
    if UPPERCHAR.include?(char)
      store[:uppercase] += 1
    elsif LOWERCHAR.include?(char)
      store[:lowercase] += 1
    else
      store[:neither] += 1
    end
  end
  store
end



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }