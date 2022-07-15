VALID_OCTAL = (0..7).to_a

class Octal
  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    result = 0
    octal_array = @octal_num.to_i.digits
    return 1 if @octal_num == '1'
    return 0 unless valid_octal?

    octal_array.each_with_index do |digit, idx|
      return 0 unless VALID_OCTAL.include?(digit)

      result += digit * 8**idx
    end
    result
  end

  def valid_octal?
    @octal_num.chars.all? { |num| num =~ /[0-7]/ }
  end
end
