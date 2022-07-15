
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

words.each do |word|
  sorted_word = word.chars.sort.join
  temp_arr = []
  words.each do |word2|
    temp_arr << word2 if sorted_word == word2.chars.sort.join
  end
  p temp_arr
end
