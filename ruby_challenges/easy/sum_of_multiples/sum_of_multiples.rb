class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.size.positive? ? multiples : [3, 5]
  end

  def to(max)
    sum_array = []
    @multiples.each { |num| sum_array += return_sum_of_multiples(num, max) }
    sum_array.uniq.sum
  end

  def return_sum_of_multiples(num, max)
    arr = []
    current_num = num
    return [] if num >= max

    loop do
      arr << current_num
      current_num += num
      break if current_num >= max
    end
    arr
  end

  def self.to(max)
    SumOfMultiples.new.to(max)
  end
end
