class Cat
  # could just use attr_reader instead
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

def name
  @name
end
kitty = Cat.new('Sophie')
kitty.greet