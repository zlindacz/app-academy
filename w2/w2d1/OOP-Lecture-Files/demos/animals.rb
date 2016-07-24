class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def go
    puts "Here comes #{title}"
    do_stuff
  end

  def title
    "#{name} the #{self.class}"
  end
end

module Loud
  LAND_SOUNDS = [
    :stomp,
    :run,
    :trample
  ]

  WATER_SOUNDS = [
    :glug,
    :swim
  ]

  def do_stuff
    sounds.each do |sound|
      5.times do
        puts "#{title} loudly #{sound}s"
      end
    end
  end
end

module Quiet
  def do_stuff
    actions.each do |action|
      puts "#{title} quietly #{action}s"
    end
  end
end

class Sloth < Animal
  include Quiet

  def actions
    [:sit, :climb, :sleep]
  end
end

class Elephant < Animal
  include Loud

  def sounds
    Loud::LAND_SOUNDS + Loud::WATER_SOUNDS
  end
end

class Bear < Animal
  include Loud

  def sounds
    Loud::LAND_SOUNDS
  end
end

class Whale < Animal
  include Loud

  def sounds
    Loud::WATER_SOUNDS
  end
end

