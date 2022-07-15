class Cat
  @@num_cats = 0

  def initialize
    @@num_cats += 1
  end
  
  def self.total
    puts "#{@@num_cats}"
  end
end


kitty1 = Cat.new
kitty2 = Cat.new

Cat.total