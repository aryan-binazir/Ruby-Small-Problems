statement = "The Flintstones Rock"
count_hash = {}

statement.delete(' ').split('').each do |letter|
  if count_hash[letter] == nil
    count_hash[letter] = 1
  else 
    count_hash[letter] = count_hash[letter] + 1
  end
end

p count_hash
