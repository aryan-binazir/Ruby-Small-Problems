class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(dna2)
    if dna2.size > @dna.size
      hamming_calculator(@dna, dna2)
    else
      hamming_calculator(dna2, @dna)
    end
  end

  def hamming_calculator(first_dna, second_dna)
    hamming_dist = 0
    first_dna_array = first_dna.chars
    second_dna_array = second_dna.chars
    first_dna_array.each_with_index do |char, index|
      hamming_dist += 1 unless char == second_dna_array[index]
    end
    hamming_dist
  end
end
