class Diamond
  INTERIOR_GAP_HSH = ('A'..'Z').to_a.zip([0, 1, 3, 5, 7, 9, 11, 13, 15,
                                          17, 19, 21, 23, 25, 27, 29, 31,
                                          33, 35, 37, 39, 41, 43, 45, 47,
                                          49]).to_h.freeze

  def self.make_diamond(last_letter)
    output_array = []
    total_gap = INTERIOR_GAP_HSH[last_letter] + 2
    if last_letter == 'A'
      create_line_a(total_gap, true)
    else
      'B'.upto(last_letter) do |letter|
        output_array << create_line(letter, total_gap) + "\n"
      end

      create_result(output_array, total_gap)

    end
  end

  def self.create_result(output_array, total_gap)
    result = ''
    reverse_array = output_array[0..-2].reverse
    result += create_line_a(total_gap) + "\n"
    result += output_array.join
    result += reverse_array.join
    result += create_line_a(total_gap) + "\n"
    result
  end

  def self.create_line(current_letter, total_gap)
    interior_gap = INTERIOR_GAP_HSH[current_letter]
    gap_per_side = (total_gap - interior_gap - 2) / 2
    (' ' * gap_per_side) + current_letter + (' ' * interior_gap) +
      current_letter + (' ' * gap_per_side)
  end

  def self.create_line_a(total_gap, lone_a = false)
    if lone_a
      "A\n"
    else
      gap_per_side = (total_gap - 1) / 2
      ' ' * gap_per_side + 'A' + ' ' * gap_per_side
    end
  end
end
