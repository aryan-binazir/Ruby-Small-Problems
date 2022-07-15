class Anagram
  def initialize(word)
    @word = word
  end

  def match(sublist)
    results_array = []
    sublist.each { |word| results_array << word if anagram?(word) }
    results_array
  end

  def anagram?(word2)
    w1 = @word.downcase
    w2 = word2.downcase
    return false if w1.downcase == w2.downcase

    w1.downcase.chars.sort == w2.downcase.chars.sort
  end
end
