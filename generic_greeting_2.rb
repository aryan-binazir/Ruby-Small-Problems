class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hi #{self.name}! Hope are well, meowwww"
  end

  def self.generic_greeting
    puts "Hello! I take it that you're a cat?"
  end
end

kitty = Cat.new('Sophie')
Cat.generic_greeting
kitty.personal_greeting