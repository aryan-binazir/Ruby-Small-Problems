class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless sides_greater_than_zero? &&
                               side_equality_verified?
  end

  def kind
    return 'scalene' if scalene?
    return 'isosceles' if isosceles?
    return 'equilateral' if equilateral?
  end

  def sides_greater_than_zero?
    @sides.all?(&:positive?)
  end

  def side_equality_verified?
    arr = @sides.sort
    arr[0] + arr[1] > arr[2]
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def scalene?
    @sides.uniq.size == 3
  end

  def isosceles?
    @sides.uniq.size == 2
  end
end
