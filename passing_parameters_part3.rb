items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1 

gather(items) do |*produce , last_produce|
  puts produce.join(', ')
  puts last_produce
end


=begin
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!

=end

# 2

gather(items) do |first_produce, *produce , last_produce|
  puts first_produce
  puts produce.join(", ")
  puts last_produce
end

=begin
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
=end

# 3

gather(items) do |first_produce, *produce|
  puts first_produce
  puts produce.join(", ")
end

=begin
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end

# 4

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

=begin
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end