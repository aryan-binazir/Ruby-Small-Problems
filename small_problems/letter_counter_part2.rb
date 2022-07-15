
def word_sizes(str)
  parse_arr = str.split(' ')
  hash_counter = Hash.new(0)

  parse_arr.each do |word|
  word.delete!('^A-Za-z')
  hash_counter[word.size] += 1
  end
  p hash_counter
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}