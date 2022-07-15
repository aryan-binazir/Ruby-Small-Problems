
def featured(num)
  current_num = num + 1
  loop do
    if current_num % 7 == 0 && 
      current_num.digits.uniq.join == current_num.digits.join && 
      current_num.odd?
      break
    end
    current_num += 1
    if num > 987654321
      puts "NO POSSIBLE NUMBER"
      exit
    end
  end
  current_num
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
