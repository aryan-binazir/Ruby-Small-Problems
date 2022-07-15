LOWERCASE = ('a'..'z').to_a

def uppercase?(str)
  str.chars.each do |char|
    return false if LOWERCASE.include?(char)
  end
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true