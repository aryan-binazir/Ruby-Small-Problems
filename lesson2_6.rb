class Animal
  def swim
    "can't swim!"
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    "can't fetch"
  end
end

class Cat < Animal
  def speak
    'Meow!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

pete = Animal.new
kitty = Cat.new
dave = Dog.new
bud = BullDog.new

p pete.run                # => "running!"
# p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
p kitty.fetch             # => "Can't fetch"

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"