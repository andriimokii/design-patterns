# Factory method
# - Provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

# ConcreteProduct1
class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts("Duck #{@name} is eating.")
  end

  def speak
    puts("Duck #{@name} says Quack!")
  end

  def sleep
    puts("Duck #{@name} sleeps quietly.")
  end
end

# ConcreteProduct2
class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts("Frog #{@name} is eating.")
  end

  def speak
    puts("Frog #{@name} says Crooooaaaak!")
  end

  def sleep
    puts("Frog #{@name} doesn't sleep; he croaks all night!")
  end
end

# Creator
class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("Animal#{i}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end
end

# ConcreteCreator1
class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

# ConcreteCreator2
class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

duck_pond = DuckPond.new(3)
duck_pond.simulate_one_day
frog_pond = FrogPond.new(3)
frog_pond.simulate_one_day
