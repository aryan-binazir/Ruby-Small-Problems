require 'pry'
VOWELS = %w(a e i o u A E I O U)

def remove_vowels(arr)
  arr.each do |str|
    VOWELS.each do |vwl|
      str.delete!(vwl)
      #binding.pry
    end
  end
  arr
end

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
