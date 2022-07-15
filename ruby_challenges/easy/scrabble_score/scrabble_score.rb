SCORE_HSH = ('a'..'z').to_a.zip([1, 3, 3, 2, 1, 4, 2, 4, 1,
                                 8, 5, 1, 3, 1, 1, 3, 10, 1,
                                 1, 1, 1, 4, 4, 8, 4, 10]).to_h

class Scrabble
  def initialize(word)
    @word = if word.nil?
              ''
            else
              @word = word
            end
  end

  def score
    sum_array = []
    return 0 if @word.empty?

    letters = @word.downcase.gsub(/[^a-z]/, '').delete(' ').chars
    letters.each do |char|
      sum_array << SCORE_HSH[char] if ('a'..'z').include?(char)
    end
    sum_array.empty? ? 0 : sum_array.reduce(&:+)
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
