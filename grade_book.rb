
def get_grade(gr1, gr2, gr3)
  average = (gr1 + gr2 + gr3)/3
  case
  when average >= 90
    'A'
  when average >= 80
    'B'
  when average >= 70
    'C'
  when average >= 60
    'D'
  when average < 60
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
