ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each do |name, age|
  ages.delete(name) if age >= 100 
end

p ages

# alternatively ages.keep_if { |_, age| age < 100 }