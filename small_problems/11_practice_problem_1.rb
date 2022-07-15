flintstones_hash = {}

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_index do |item, index|
  flintstones_hash[item] = index
end

p flintstones_hash
