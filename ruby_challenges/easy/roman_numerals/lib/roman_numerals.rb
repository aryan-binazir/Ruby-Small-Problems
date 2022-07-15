# Mostly from solution

class RomanNumeral
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    result_number = ''
    number_to_convert = @number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = number_to_convert.divmod(value)
      if multiplier > 0
        result_number += (key * multiplier)
      end
      number_to_convert = remainder
    end
    result_number
  end
end