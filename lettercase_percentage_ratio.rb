
ALPHAUPPER = ('A'..'Z').to_a
ALPHALOWER = ('a'..'z').to_a

def letter_percentages(str)
  lower_counter = 0
  upper_counter = 0
  neither_counter = 0
  total_size = str.size
  
  str.chars.each do |char|
    if ALPHAUPPER.include?(char)
      upper_counter += 1
    elsif ALPHALOWER.include?(char)
      lower_counter += 1
    else
      neither_counter += 1
    end  
  end
  
  { lowercase: (lower_counter.to_f/total_size.to_f)*100, uppercase: (upper_counter.to_f/total_size.to_f)*100, neither: (neither_counter.to_f/total_size.to_f)*100 }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
