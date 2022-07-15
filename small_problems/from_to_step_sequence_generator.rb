def step(start_val, end_value, step_value)
  current_value = start_val

  loop do
    break if current_value > end_value
    yield(current_value)
    current_value += step_value
  end
end


step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10