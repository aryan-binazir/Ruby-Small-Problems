module Semitrailer
  def attach_semitrailer
    puts "Semitrailer attached!"
  end
end

class Vehicle
  attr_accessor :color, :current_speed, :on_off_status
  attr_reader :year, :model
  
  @@num_vehicles = 0
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @on_off_status = 'on'
    @@num_vehicles += 1
  end

  def self.num_vehicles
    puts "There are #{@@num_vehicles} created!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} mpg"
  end

  def speed_up(number)
    self.current_speed += number
  end
  
  def brake(number)
    self.current_speed -= number unless (current_speed - number) < 0
  end

  def shut_off
    self.on_off_status = 'off'
    self.current_speed = 0
  end

  def get_speed
    self.current_speed
  end

  def get_info
    if self.on_off_status == 'on'
      "#{self.year} #{self.color} #{self.model} driving at #{self.get_speed} km/h"
    else
      "#{self.year} #{self.color} #{self.model} is currently #{self.on_off_status}"
    end
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Your #{self.model} is now #{self.color}"
  end
  
  def age 
    "Your vehicle is #{age_of_vehicle} years old"
  end

  private

  def age_of_vehicle
    Time.now.year - self.year.to_i
  end
end

class MyCar < Vehicle
  
  NUMBER_OF_DOORS = 4
  def to_s
    puts "My car is a #{year} #{@model} (#{color})"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Semitrailer
  def to_s
    puts "My truck is a #{year} #{@model} (#{color})"
  end
end

accord = MyCar.new(2017, 'White', 'Honda Accord')
volvo = MyTruck.new(2001, 'Black', 'Volvo')

p accord.age
p volvo.age