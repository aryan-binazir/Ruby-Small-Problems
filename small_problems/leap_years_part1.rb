
def leap_year?(year)
  if (year % 4 == 0) && (year % 100 != 0)
    true
  elsif (year % 4 == 0) && (year % 100 == 0) && 
    (year % 400 == 0)
    true
  else
    false
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true