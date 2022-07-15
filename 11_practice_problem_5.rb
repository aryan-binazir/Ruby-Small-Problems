flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name[0..1] == "Be" }