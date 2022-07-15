
def word_sizes(str)
  parse_arr = str.split(' ')
  hash_counter = {}

  parse_arr.each do |word|
    if hash_counter.has_key?(word.size)
      hash_counter[word.size] += 1
    else
      hash_counter[word.size] = 1
    end
  end
  hash_counter
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
