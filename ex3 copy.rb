family = {  uncle: ["bob", "joe", "steve"],
  sister: ["jane", "jill", "beth"],
  brother: ["frank","rob","david"],
  aunt: ["mary","sally","susan"]
}

family.each do |key, value|
  value.each do |name|
    puts "#{name}: #{key}"
  end
end