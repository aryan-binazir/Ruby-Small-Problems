class PerfectNumber
  def self.classify(original_num)
    raise StandardError if original_num < 1

    aliquot_sum = find_aliquot_sum(original_num)

    if original_num == aliquot_sum
      'perfect'
    elsif original_num > aliquot_sum
      'deficient'
    else
      'abundant'
    end
  end

  def self.find_aliquot_sum(original_num)
    positive_dividers = []

    1.upto original_num / 2 do |current_num|
      positive_dividers << current_num if (original_num % current_num).zero?
    end
    positive_dividers.empty? ? 0 : positive_dividers.reduce(&:+)
  end
end
