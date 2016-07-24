class CarError < StandardError
  attr_reader :msg

  def initialize(msg)
    @msg = msg
  end
end

class EngineStalledError < CarError

  def initialize(msg)
    super
  end

end

class CollisionOccurredError < CarError

  def initialize(msg)
    super
  end

  def damage
    rand(10_000)
  end
end


def drive_car
  raise EngineStalledError.new('STALLED') if rand(3) == 1
  raise CollisionOccurredError.new('COLLISION') if rand(5) == 1

  rescue EngineStalledError => e
    puts e.msg
  retry
  rescue CollisionOccurredError => e
    puts e.msg + " and caused $#{e.damage} worth of damage"
  ensure
    puts "Car stopped."
end

drive_car
