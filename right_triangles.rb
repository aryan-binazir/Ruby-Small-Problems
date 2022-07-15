=begin
--------------------------PROBLEM----------------------------------------
Input: positive integer

Output: displays a right triangle
---------------------------RULES-----------------------------------------
Explicit: 
- Displays a right triangle whose sides each have n stars
- The hypotenuese should have one end at lower-left of the triangle and other end at upper-right

Implicit: 
--------------------------EXAMPLES---------------------------------------


-------------------------DATA/ALGO---------------------------------------
integer n for overall size of triangle
integer spaces = n 

algorithm

1. set integer n to argument given
2. print n - current iteration spaces 
3. print current iteration *
4. got to next line and repeat 2-3

=end

def triangle(number)
  spaces = number - 1
  stars = 1

  number.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)
triangle(9)