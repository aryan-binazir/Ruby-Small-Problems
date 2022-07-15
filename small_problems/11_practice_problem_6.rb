flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  flintstones[index] = name[0, 3]
end

p flintstones
