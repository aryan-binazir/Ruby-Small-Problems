require 'pry'
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time)
  time_arr = time.split(':')
  total_minutes = (time_arr[0].to_i * MINUTES_PER_HOUR) + time_arr[1].to_i
  total_minutes % 1440
end

def before_midnight(time)
  time_arr = time.split(':')
  total_minutes = (time_arr[0].to_i * MINUTES_PER_HOUR) + time_arr[1].to_i
  total_minutes = total_minutes % MINUTES_PER_DAY
  total_minutes = 1440 if total_minutes == 0 
  1440 - total_minutes
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
