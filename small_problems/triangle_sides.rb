def triangle(side1, side2, side3)
  arr = [side1, side2, side3].sort
  
  case
  when arr[0] < 0 || arr[1] < 0 || arr[2] < 0
    :invalid
  when arr[0] == arr[2]
    :equilateral
  when arr[2] >= arr[0] + arr [1] 
    :invalid
  when arr[0] == arr[1] || arr[1] == arr[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid