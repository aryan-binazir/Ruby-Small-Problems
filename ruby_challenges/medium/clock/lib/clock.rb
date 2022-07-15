class Clock
  attr_accessor :time

  MINUTES_PER_DAY = 24 * 60

  def initialize(hours, minutes=0)
    @time = (hours * 60) + minutes
  end

  def to_s
    hours = time / 60
    minutes = time % 60
    format('%02d:%02d', hours, minutes)
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def ==(other_clock)
    time == other_clock.time
  end

  def +(amount)
    current_time = time
    self.time = check_wrap_around(current_time + amount)
    self
  end

  def -(amount)
    current_time = time
    self.time = check_wrap_around(current_time - amount)
    self
  end

  def check_wrap_around(time)
    time % MINUTES_PER_DAY
  end
end
