require 'date'

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(day, nth)
    first_day_to_search = SCHEDULE_START_DAY[nth.downcase]
    first_day_to_search = (@days_in_month - 6) if first_day_to_search.nil?
    date = Date.new(@year, @month, first_day_to_search)

    loop do
      break if check_day_of_week?(date, day.downcase)
      date = date.next
      return nil unless date.month == @month
    end
    date
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def check_day_of_week?(date, day)
    case day
    when 'monday' then date.monday?
    when 'tuesday' then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday' then date.thursday?
    when 'friday' then date.friday?
    when 'saturday' then date.saturday?
    when 'sunday' then date.sunday?
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
