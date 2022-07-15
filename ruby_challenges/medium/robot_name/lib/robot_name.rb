class Robot
  CAPITAL_LETTERS = ("A".."Z").to_a
  NUMBERS = ("1".."9").to_a

  attr_accessor :name, :names_in_use

  def initialize
    @names_in_use = []
    reset
  end

  def reset
    Kernel.srand
    temp_name = ''
    loop do
      temp_name = ''
      2.times { temp_name += CAPITAL_LETTERS.sample }
      3.times { temp_name += NUMBERS.sample }
      break unless names_in_use.include?(temp_name)
    end
    self.name = temp_name
  end
end
