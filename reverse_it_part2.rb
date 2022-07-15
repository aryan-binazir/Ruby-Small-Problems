def reverse_words(str)
  arr = str.split(' ')

  arr.each do |word|
    word.reverse! if word.size >= 5
  end

  arr.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
