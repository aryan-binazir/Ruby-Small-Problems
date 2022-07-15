class Greeting
  def greet(message)
    puts message
  end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye
  def bye
    greet("Goodbye")
  end
end

