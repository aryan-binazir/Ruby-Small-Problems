
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
youngest = ages.values.shift

ages.each { |name, age| youngest = age if age < youngest}
p youngest

#alternatively ages.values.min
