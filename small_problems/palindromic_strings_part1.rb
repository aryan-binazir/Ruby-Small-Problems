
# further exploration
def palindrome?(array_or_string)
  array_or_string == array_or_string.reverse
end


=begin
def palindrome?(str)
  str == str.reverse
end
=end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
palindrome?(['m','a','d','a','m']) == true