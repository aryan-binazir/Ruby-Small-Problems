=begin
Problem: 
Based on the examples shown above, write a 
method that takes an array as an argument. 
The method should yield the contents of the 
array to a block, which should assign your 
block variables in such a way that it ignores 
the first two elements, and groups all remaining 
elements as a raptors array.

Rules:
  - method should yield content of array to block
  - assign block variables in a way that it ignores 
  the first two elements
  - groups all remaining elements as a raptors array


Input: array
Output: N/A


Examples:
N/A

Data Structures:
  - block which takes in all elements except last 2
  - 3 variables representing first, second and rest

Algorithm:

# method categories

# take in birds array

# yield birds array to block


# block 
  # make block parameter ignore first 2
  # join and output rest of elements
=end
birds = %w(raven finch hawk eagle)

def categories(birds)
  yield(birds)
end

categories(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors}"
end