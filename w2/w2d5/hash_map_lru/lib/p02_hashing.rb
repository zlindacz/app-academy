class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1234567890 if empty?
    map { |character| character.to_s.hash }.inject(:-)
  end
end

class String
  def hash
    hashed = []
    chars.each do |character|
      hashed << character.ord.hash
    end
    hashed.inject { |acc, el| acc -= el % 1234567890 }
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_s.hash
  end
end
