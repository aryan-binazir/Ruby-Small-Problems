words = "the flintstones rock"

def titleize (sentence)
  sentence.split.each { |word| word.capitalize! }.join(' ')
end

p titleize(words)
