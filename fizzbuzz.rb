def fizzbuzz(start_num, end_num)
  counter = start_num
  loop do
      if counter % 3 == 0
        if counter % 5 == 0
          puts 'FizzBuzz'
        else
          puts 'Fizz'
        end
      elsif counter % 5 == 0
        puts 'Buzz'
      else
        puts counter
      end
    break if counter == end_num
    counter += 1
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz