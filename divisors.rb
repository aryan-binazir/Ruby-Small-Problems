def divisors(target_num)
  current_num = 1
  highest_divisor = target_num / 2
  results_arr = [target_num]

  loop do
    break if current_num == ( highest_divisor + 1 )
    results_arr << current_num if target_num % current_num == 0
    current_num += 1
  end
  results_arr.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]