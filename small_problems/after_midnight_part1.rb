MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(minutes_input)
  while minutes_input < 0
    minutes_input += MINUTES_PER_DAY
  end

  minutes_input = minutes_input % MINUTES_PER_DAY
  hours, minutes = minutes_input.divmod(60)
  format('%02d:%02d', hours, minutes)
end



time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"