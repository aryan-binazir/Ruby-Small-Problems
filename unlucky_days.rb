require 'date'

def friday_13th(year)
  unlucky_count = 0
  chosen_date = Date.civil(year, 1, 13)
  1.upto(12) do
    unlucky_count += 1 if chosen_date.friday?
    chosen_date = chosen_date.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2