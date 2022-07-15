class Series
  def initialize(series_num)
    @series_num = series_num
  end

  def slices(len)
    i = 0
    results = []
    sequence = @series_num.chars.map!(&:to_i)
    raise ArgumentError if len > sequence.size

    loop do
      break if (len + i) > sequence.size

      results << sequence.slice(i, len)
      i += 1
    end
    results
  end
end
