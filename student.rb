class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end
  protected

  def grade
    @grade
  end
end

Mike = Student.new('Mike', 87)
Alicia = Student.new('Ali', 88)

puts "Well done!" if Alicia.better_grade_than?(Mike)